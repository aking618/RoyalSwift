//
//  String+Extensions.swift
//  RoyalSwift
//
//  Created by Ayren King on 2/4/24.
//

public extension String {
    subscript(_ n: Int) -> Character {
        get {
            let idx = index(startIndex, offsetBy: n)
            return self[idx]
        }
        set {
            let idx = index(startIndex, offsetBy: n)
            replaceSubrange(idx ... idx, with: [newValue])
        }
    }
    
    /// Checks if the string contains another string in a case-insensitive manner, optionally ignoring leading and trailing whitespaces.
    ///
    /// - Parameters:
    ///   - otherString: The string to search for within the string.
    /// - Returns: `true` if the string contains the other string (or is considered empty when the
    /// other string is empty after trimming leading and trailing whitespaces); otherwise, `false`.
    func caseInsensitiveContains(_ otherString: String) -> Bool {
        let trimmedString = otherString.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedString.isEmpty { return true }

        return lowercased().contains(trimmedString.lowercased())
    }
}
