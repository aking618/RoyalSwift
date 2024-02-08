//
//  Node.swift
//
//
//  Created by Ayren King on 2/7/24.
//

class Node: Equatable {
    typealias Point = (x: Int, y: Int)
    
    var parent: Node? = nil
    
    /// Location on the grid
    var point: Point

    /// Total cost of the node
    private var f: Int = 0

    /// Distance between the current node and the start node
    private var g: Int = 0

    /// Heuristic: estimated distance from the current node to the end node
    private var h: Int = 0
    
    init(parent: Node? = nil, point: Point) {
        self.parent = parent
        self.point = point
    }

    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.point == rhs.point
    }
    
    private func returnPath() -> [Point] {
        var path: [Point] = []
        var current: Node? = self
        while current != nil {
            path.append(current!.point)
            current = current?.parent
        }
        return path
    }
    
    /// Calculates the A* distance between the current node and the destination point on a grid represented by a two-dimensional array.
    ///
    /// - Parameters:
    ///   - destination: The destination point to calculate the distance to.
    ///   - grid: The grid representing the environment where the distance is calculated.
    ///   - allowDiagonals: A Boolean value indicating whether diagonal movement is allowed.
    ///   - obstacle: An optional obstacle element in the grid.
    /// - Returns: The A* distance between the current node and the destination point. Returns -1 if no path is found.
    func aStarDistance<T:Equatable>(
        to destination: Point,
        grid: [[T]],
        allowDiagonals: Bool = false,
        obstacle: T? = nil
    ) async -> Int {
        let startNode = Node(parent: nil, point: point)
        let endNode = Node(parent: nil, point: destination)

        var openList: [Node] = [startNode]
        var closedList: [Node] = []

        var adjacentPositions: [Point] = [(x: 0, y: 1), (x: 0, y: -1), (x: 1, y: 0), (x: -1, y: 0)]
        if allowDiagonals {
            adjacentPositions.append(contentsOf: [(x: -1, y: -1), (x: 1, y: -1), (x: -1, y: 1), (x: 1, y: 1)])
        }

        while !openList.isEmpty {
            let currentNode = openList.sorted(by: { $0.f < $1.f }).first!
            openList.remove(at: openList.firstIndex(of: currentNode)!)
            closedList.append(currentNode)

            if currentNode == endNode {
                return currentNode.returnPath().count - 1
            }

            var children: [Node] = []
            for adjacentPosition in adjacentPositions {
                let nodePosition: Point = (x: currentNode.point.x + adjacentPosition.x, y: currentNode.point.y + adjacentPosition.y)

                guard nodePosition.x < grid.first!.count &&
                    nodePosition.x >= 0 &&
                    nodePosition.y < grid.count &&
                    nodePosition.y >= 0
                else {
                    continue
                }
                
                guard grid[nodePosition.y][nodePosition.x] != obstacle else { continue }

                let newNode = Node(parent: currentNode, point: nodePosition)
                children.append(newNode)
            }

            for (childIndex, _) in children.enumerated() {
                guard !closedList.contains(children[childIndex]) else { continue }
                let point = children[childIndex].point

                children[childIndex].g = currentNode.g + 1
                children[childIndex].h = (point.x - endNode.point.x).squared + (point.y - endNode.point.y).squared
                children[childIndex].f = children[childIndex].g + children[childIndex].h

                guard !openList.contains(children[childIndex]) else { continue }

                openList.append(children[childIndex])
            }
        }

        return -1
    }
}
