//
//  Grid.swift
//
//
//  Created by Ayren King on 2/9/24.
//

public typealias Point = (x: Int, y: Int)

/// Represents a 2-dimenional array of values.
public class Grid<T:Equatable> {
    var values: [[T]]
    
    
    /// Initializes a grid that represents a 2D array of Equatables.
    /// - Parameter values: 2D array of Equatables to represent as a grid.
    public init(values: [[T]]) {
        self.values = values
    }
    
    /// Calculates the A* distance between the start node and the destination point on the grid.
    ///
    /// - Parameters:
    ///   - from: The start point to calculate the distnace from.
    ///   - destination: The destination point to calculate the distance to.
    ///   - allowDiagonals: A Boolean value indicating whether diagonal movement is allowed.
    ///   - obstacle: An optional obstacle element in the grid.
    /// - Returns: The A* distance between the start node and the destination point. Returns -1 if no path is found.
    public func aStarDistance(
        from start: Point,
        to destination: Point,
        allowDiagonals: Bool = false,
        obstacle: T? = nil
    ) async -> Int {
        let startNode = Node(parent: nil, point: start)
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
                return returnPath(from: currentNode).count - 1
            }

            var children: [Node] = []
            for adjacentPosition in adjacentPositions {
                let nodePosition: Point = (x: currentNode.point.x + adjacentPosition.x, y: currentNode.point.y + adjacentPosition.y)

                guard nodePosition.x < values.first!.count &&
                    nodePosition.x >= 0 &&
                    nodePosition.y < values.count &&
                    nodePosition.y >= 0
                else {
                    continue
                }
                
                guard values[nodePosition.y][nodePosition.x] != obstacle else { continue }

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
    
    private func returnPath(from start: Node) -> [Point] {
        var path: [Point] = []
        var current: Node? = start
        while current != nil {
            path.append(current!.point)
            current = current?.parent
        }
        return path
    }
}
