//
//  Node.swift
//
//
//  Created by Ayren King on 2/7/24.
//

/// Represents a node in a grid, used in pathfinding algorithms such as A*.
public class Node: Equatable {
    
    /// The parent node of the current node in the path.
    public var parent: Node? = nil
    
    /// Location on the grid
    public var point: Point

    /// Total cost of the node
    public var f: Int = 0

    /// Distance between the current node and the start node
    public var g: Int = 0

    /// Heuristic: estimated distance from the current node to the end node
    public var h: Int = 0
    
    /// Initializes a node with optional parent node and a point on the grid.
    ///
    /// - Parameters:
    ///   - parent: The parent node of the current node in the path. Default is `nil`.
    ///   - point: The location of the node on the grid.
    public init(parent: Node? = nil, point: Point) {
        self.parent = parent
        self.point = point
    }

    /// Checks if two nodes are equal by comparing their points.
    public static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.point == rhs.point
    }
}
