//
//  Array+Extensions.swift
//  RoyalSwift
//
//  Created by Ayren King on 2/4/24.
//

import Foundation

public extension Array {
    /// Removes and returns the first element of the collection if it is non-empty,
    /// providing a safe alternative to the `removeFirst()` method.
    ///
    /// The `popFirst` method modifies the collection by removing the first element
    /// and returns the removed element. If the collection is empty, the method returns `nil`.
    ///
    /// - Returns: The first element of the collection, or `nil` if the collection is empty.
    ///
    /// - Note: Use `popFirst()` as a safe alternative to `removeFirst()` when you want to avoid
    ///         runtime errors in case of an empty collection.
    ///
    /// - Complexity: O(n), where n is the length of the collection. Removing the first element
    ///               involves shifting the remaining elements to fill the gap.
    @discardableResult
    mutating func popFirst() -> Element? {
        guard let first else { return nil }
        removeFirst(1)
        return first
    }
}
