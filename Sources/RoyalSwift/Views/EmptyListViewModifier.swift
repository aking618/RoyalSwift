//
//  EmptyListViewModifier.swift
//
//
//  Created by Ayren King on 2/9/24.
//

import SwiftUI

/// A view modifier that conditionally displays either the content or a placeholder based on the presence of items.
///
/// Use `EmptyDataModifier` to conditionally show content or a placeholder based on the presence of items in a collection.
/// When the `items` array is not empty, the content is displayed; otherwise, the placeholder is shown.
///
/// ```swift
/// List(data)
///     .modifier(
///         EmptyDataModifier(
///             items: data,
///             placeholder: Text("Data is empty")
///         )
///      )
/// ```
public struct EmptyListModifier<Placeholder: View>: ViewModifier {
    /// An array of items to determine whether content or placeholder should be displayed.
    public let items: [Any]
    
    /// The placeholder view to display when `items` is empty.
    public let placeholder: Placeholder

    /// Modifies the view to display either the content or the placeholder based on the presence of items.
    ///
    /// - Parameter content: The content view to modify.
    /// - Returns: A view displaying either the content or the placeholder based on the presence of items.
    public func body(content: Content) -> some View {
        if !items.isEmpty {
            content
        } else {
            placeholder
        }
    }
}
