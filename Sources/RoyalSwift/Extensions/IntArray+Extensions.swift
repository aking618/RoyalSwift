//
//  IntArray+Extensions.swift
//  RoyalSwift
//
//  Created by Ayren King on 2/4/24.
//

public extension Array where Element == Int {
    /// The least common multiple (LCM) of the integers in the array.
    ///
    /// The LCM is the smallest positive integer that is divisible by each of the given integers.
    /// The property utilizes the Euclidean algorithm to calculate the greatest common divisor (GCD)
    /// of two numbers and then applies the formula LCM(a, b) = |a * b| / GCD(a, b) to determine
    /// the LCM of all numbers in the array.
    ///
    /// - Note: If the array is empty, the property returns 0, as there is no meaningful LCM for an
    ///   empty set of numbers.
    var leastCommonMultiple: Int {
        func calculateGreatestCommonDivisor(_ x: Int, _ y: Int) -> Int {
            var largerNumber = x
            var smallerNumber = y
            while smallerNumber != 0 {
                let remainder = smallerNumber
                smallerNumber = largerNumber % smallerNumber
                largerNumber = remainder
            }
            return abs(largerNumber)
        }

        // LCM(a, b) = |a * b| / GCD(a, b)
        func calculateLeastCommonMultipleOfTwo(_ a: Int, _ b: Int) -> Int {
            abs(a * b) / calculateGreatestCommonDivisor(a, b)
        }

        guard let firstNumber = first else {
            return 0 // Return 0 for an empty array, as there's no meaningful LCM.
        }

        return dropFirst().reduce(firstNumber) { result, nextNumber in
            calculateLeastCommonMultipleOfTwo(result, nextNumber)
        }
    }
}
