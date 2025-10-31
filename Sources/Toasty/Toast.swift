//
//  Toast.swift
//  Toasty
//
//  Created by Toasty Package
//

import SwiftUI

/// A toast message that can be displayed in the toast overlay
public struct Toast: Identifiable {
    public let id: String
    public var content: AnyView
    
    /// View properties (internal)
    internal var offsetX: CGFloat = 0
    internal var isDeleting: Bool = false
    
    /// Per-toast configuration
    public var appearance: ToastAppearance?
    public var behavior: ToastBehavior?
    
    public init(
        id: String = UUID().uuidString,
        appearance: ToastAppearance? = nil,
        behavior: ToastBehavior? = nil,
        @ViewBuilder content: @escaping (String) -> some View
    ) {
        self.id = id
        self.appearance = appearance
        self.behavior = behavior
        self.content = .init(content(id))
    }
}

