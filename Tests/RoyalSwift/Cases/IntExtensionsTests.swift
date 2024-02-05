//
//  IntExtensionsTests.swift
//
//
//  Created by Ayren King on 2/4/24.
//

import XCTest

@testable import RoyalSwift

class IntExtensionsTests: XCTestCase {
    
    // MARK: - Squared
    
    func testSquaredPositiveNumber() {
        let number = 5
        XCTAssertEqual(number.squared, 25, "Squared value of a positive number is incorrect")
    }

    func testSquaredZero() {
        let number = 0
        XCTAssertEqual(number.squared, 0, "Squared value of zero is incorrect")
    }

    func testSquaredNegativeNumber() {
        let number = -3
        XCTAssertEqual(number.squared, 9, "Squared value of a negative number is incorrect")
    }
    
    // MARK: - Least Common Multiple
    
    func testLeastCommonMultiplePositiveNumbers() {
        let numbers = [2, 3, 5, 7]
        XCTAssertEqual(numbers.leastCommonMultiple, 210, "Least common multiple of positive numbers is incorrect")
    }

    func testLeastCommonMultipleZero() {
        let numbers = [0, 2, 4, 6]
        XCTAssertEqual(numbers.leastCommonMultiple, 0, "Least common multiple including zero is incorrect")
    }

    func testLeastCommonMultipleNegativeNumbers() {
        let numbers = [-2, -3, -5, -7]
        XCTAssertEqual(numbers.leastCommonMultiple, 210, "Least common multiple of negative numbers is incorrect")
    }

    func testLeastCommonMultipleMixedNumbers() {
        let numbers = [-2, 3, 5, -7]
        XCTAssertEqual(numbers.leastCommonMultiple, 210, "Least common multiple of mixed numbers is incorrect")
    }

    func testLeastCommonMultipleEmptyArray() {
        let numbers: [Int] = []
        XCTAssertEqual(numbers.leastCommonMultiple, 0, "Least common multiple of an empty array should be 0")
    }
}
