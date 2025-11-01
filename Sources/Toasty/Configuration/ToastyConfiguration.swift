//
//  ToastyConfiguration.swift
//  Toasty
//
//  Created by Toasty Package
//

import SwiftUI

/// Global configuration for all toasts in the Toasty system
public struct ToastyConfiguration {
    /// Animation settings
    public var animationDuration: Double
    public var animationExtraBounce: Double
    public var animationStyle: AnimationStyle
    
    /// Stack behavior
    public var stackSpacing: CGFloat
    public var stackOffsetMultiplier: CGFloat
    public var stackScaleMultiplier: CGFloat
    public var maxStackOffset: CGFloat
    public var maxStackScale: CGFloat
    
    /// Background
    public var backgroundMaterial: Material
    
    /// Swipe gestures
    public var minimumDragDistance: CGFloat
    public var dismissThreshold: CGFloat
    
    /// Position
    public var position: ToastPosition
    
    /// Auto-dismiss
    public var autoDismissDuration: TimeInterval?
    
    /// Limits
    public var maxVisibleToasts: Int?
    
    /// Padding and margins
    public var horizontalPadding: CGFloat
    public var bottomPadding: CGFloat
    public var topPadding: CGFloat
    
    /// Transitions
    public var insertionTransition: AnyTransition
    public var removalTransition: AnyTransition
    
    public init(
        animationDuration: Double = 0.3,
        animationExtraBounce: Double = 0,
        animationStyle: AnimationStyle = .snappy,
        stackSpacing: CGFloat = 10,
        stackOffsetMultiplier: CGFloat = 15,
        stackScaleMultiplier: CGFloat = 0.1,
        maxStackOffset: CGFloat = 30,
        maxStackScale: CGFloat = 1,
        backgroundMaterial: Material = .ultraThinMaterial,
        minimumDragDistance: CGFloat = 30,
        dismissThreshold: CGFloat = 200,
        position: ToastPosition = .bottom,
        autoDismissDuration: TimeInterval? = nil,
        maxVisibleToasts: Int? = nil,
        horizontalPadding: CGFloat = 25,
        bottomPadding: CGFloat = 15,
        topPadding: CGFloat = 15,
        insertionTransition: AnyTransition = .offset(y: 100),
        removalTransition: AnyTransition = .move(edge: .leading)
    ) {
        self.animationDuration = animationDuration
        self.animationExtraBounce = animationExtraBounce
        self.animationStyle = animationStyle
        self.stackSpacing = stackSpacing
        self.stackOffsetMultiplier = stackOffsetMultiplier
        self.stackScaleMultiplier = stackScaleMultiplier
        self.maxStackOffset = maxStackOffset
        self.maxStackScale = maxStackScale
        self.backgroundMaterial = backgroundMaterial
        self.minimumDragDistance = minimumDragDistance
        self.dismissThreshold = dismissThreshold
        self.position = position
        self.autoDismissDuration = autoDismissDuration
        self.maxVisibleToasts = maxVisibleToasts
        self.horizontalPadding = horizontalPadding
        self.bottomPadding = bottomPadding
        self.topPadding = topPadding
        self.insertionTransition = insertionTransition
        self.removalTransition = removalTransition
    }
    
    /// Creates the animation based on the style and duration
    public func animation() -> Animation {
        switch animationStyle {
        case .snappy:
            return .snappy(duration: animationDuration, extraBounce: animationExtraBounce)
        case .bouncy:
            return .bouncy(duration: animationDuration, extraBounce: animationExtraBounce)
        case .smooth:
            return .smooth(duration: animationDuration, extraBounce: animationExtraBounce)
        case .easeInOut:
            return .easeInOut(duration: animationDuration)
        case .spring:
            return .spring(duration: animationDuration, bounce: animationExtraBounce)
        }
    }
}

/// Animation style options
public enum AnimationStyle {
    case snappy
    case bouncy
    case smooth
    case easeInOut
    case spring
}

/// Toast position on screen
public enum ToastPosition {
    case top
    case bottom
}

