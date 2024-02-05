//
//  ArrayExtensionTests.swift
//  
//
//  Created by Ayren King on 2/4/24.
//

import XCTest

@testable import RoyalSwift

class ArrayExtensionTests: XCTestCase {
    
    func testPopFirstEmptyArray() {
        var items = [Any]()
        XCTAssertNil(items.popFirst())
    }
    
    func testPopFirstSingleElement() throws {
        var items: [Any] = [0]
        let element = try XCTUnwrap(items.popFirst())
        XCTAssertEqual(element as? Int, 0)
        XCTAssertTrue(items.isEmpty)
    }
    
    func testPopFirstMultipleElements() throws {
        var items: [Any] = [0, 1]
        items.popFirst()
        let element = try XCTUnwrap(items.popFirst())
        XCTAssertEqual(element as? Int, 1)
        XCTAssertTrue(items.isEmpty)
    }
}
