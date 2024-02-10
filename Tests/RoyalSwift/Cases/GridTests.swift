//
//  NodeTests.swift
//
//
//  Created by Ayren King on 2/7/24.
//

import XCTest

@testable import RoyalSwift

class GridTests: XCTestCase {
    
    func testAStarDistanceNoObstaclesOrDiganals() async {
        let grid = [
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0]
        ]
        
        let aStarGrid = Grid(values: grid)
        let start = (x: 0, y: 0)
        let destination = (x: 4, y: 3)
        let distance = await aStarGrid.aStarDistance(from: start, to: destination)
        XCTAssertEqual(distance, 7, "A* distance with diagonals is incorrect")
    }
    
    func testAStarDistanceNoObstaclesWithDiganals() async {
        let grid = [
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0]
        ]
        
        let aStarGrid = Grid(values: grid)
        let start = (x: 0, y: 0)
        let destination = (x: 4, y: 3)
        let distance = await aStarGrid.aStarDistance(from: start, to: destination, allowDiagonals: true)
        XCTAssertEqual(distance, 4, "A* distance with diagonals is incorrect")
    }
    
    func testAStarDistanceWithDiagonals() async {
        let grid = [
            [0, 0, 0, 0, 0],
            [0, 0, 1, 0, 0],
            [0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0]
        ]
        
        let aStarGrid = Grid(values: grid)
        let start = (x: 0, y: 0)
        let destination = (x: 3, y: 3)
        let distance = await aStarGrid.aStarDistance(from: start, to: destination, allowDiagonals: true, obstacle: 1)
        XCTAssertEqual(distance, 4, "A* distance with diagonals is incorrect")
    }

    func testAStarDistanceWithoutDiagonals() async {
        let grid = [
            [0, 0, 0, 0, 0],
            [0, 0, 1, 0, 0],
            [0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0]
        ]
        
        let aStarGrid = Grid(values: grid)
        let start = (x: 0, y: 0)
        let destination = (x: 3, y: 3)
        let distance = await aStarGrid.aStarDistance(from: start, to: destination)
        XCTAssertEqual(distance, 6, "A* distance without diagonals is incorrect")
    }

    func testAStarDistanceWithObstacle() async {
        let grid = [
            [0, 0, 0, 0, 0],
            [0, 0, 1, 0, 0],
            [0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0]
        ]
        
        let aStarGrid = Grid(values: grid)
        let start = (x: 0, y: 0)
        let destination = (x: 3, y: 3)
        let distance = await aStarGrid.aStarDistance(from: start, to: destination, obstacle: 1)
        XCTAssertEqual(distance, 6, "A* distance with obstacle should return 6")
    }
    
    func testAStarDistanceUnreachableDestination() async {
        let grid = [
            [0, 0, 1, 0, 0],
            [0, 0, 1, 0, 0],
            [0, 0, 1, 0, 0],
            [0, 0, 1, 0, 0]
        ]
        
        let aStarGrid = Grid(values: grid)
        let start = (x: 0, y: 0)
        let destination = (x: 3, y: 3)
        let distance = await aStarGrid.aStarDistance(from: start, to: destination, obstacle: 1)
        XCTAssertEqual(distance, -1, "A* distance with destination blocked should be -1")
    }
}
