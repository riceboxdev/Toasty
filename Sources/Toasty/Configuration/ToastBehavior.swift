//
//  ToastBehavior.swift
//  Toasty
//
//  Created by Toasty Package
//

import SwiftUI

/// Per-toast behavior configuration that overrides global settings
public struct ToastBehavior {
    /// Auto-dismiss
    public var autoDismissDuration: TimeInterval?
    
    /// Swipe to dismiss
    public var swipeToDismissEnabled: Bool
    
    /// Animation overrides
    public var animationDuration: Double?
    public var animationStyle: AnimationStyle?
    
    /// Custom transitions
    public var insertionTransition: AnyTransition?
    public var removalTransition: AnyTransition?
    
    /// Drag gesture customization
    public var minimumDragDistance: CGFloat?
    public var dismissThreshold: CGFloat?
    
    public init(
        autoDismissDuration: TimeInterval? = nil,
        swipeToDismissEnabled: Bool = true,
        animationDuration: Double? = nil,
        animationStyle: AnimationStyle? = nil,
        insertionTransition: AnyTransition? = nil,
        removalTransition: AnyTransition? = nil,
        minimumDragDistance: CGFloat? = nil,
        dismissThreshold: CGFloat? = nil
    ) {
        self.autoDismissDuration = autoDismissDuration
        self.swipeToDismissEnabled = swipeToDismissEnabled
        self.animationDuration = animationDuration
        self.animationStyle = animationStyle
        self.insertionTransition = insertionTransition
        self.removalTransition = removalTransition
        self.minimumDragDistance = minimumDragDistance
        self.dismissThreshold = dismissThreshold
    }
}

