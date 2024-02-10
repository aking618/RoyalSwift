//
//  Date+Extensions.swift
//
//
//  Created by Ayren King on 2/9/24.
//

import Foundation

public extension Date {
    
    /// Checks if the current date is on the same calendar day as another date.
    ///
    /// - Parameter date: The date to compare against.
    /// - Returns: `true` if the current date is on the same day as the provided date; otherwise, `false`.
    func isSameDay(as date: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: date)
    }
}
