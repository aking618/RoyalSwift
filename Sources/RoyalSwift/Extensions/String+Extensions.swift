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
}
