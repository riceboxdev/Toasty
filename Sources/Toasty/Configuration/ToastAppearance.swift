//
//  ToastAppearance.swift
//  Toasty
//
//  Created by Toasty Package
//

import SwiftUI

/// Per-toast appearance configuration that overrides global settings
public struct ToastAppearance {
    /// Colors
    public var foregroundColor: Color?
    public var backgroundColor: Color?
    public var tintColor: Color?
    
    /// Typography
    public var titleFont: Font?
    public var bodyFont: Font?
    
    /// Padding
    public var padding: EdgeInsets?
    public var horizontalPadding: CGFloat?
    
    /// Background styling
    public var backgroundMaterial: Material?
    public var backgroundShape: BackgroundShape?
    
    /// Shadow configuration
    public var shadowColor: Color?
    public var shadowRadius: CGFloat?
    public var shadowOpacity: Double?
    
    /// Border
    public var borderColor: Color?
    public var borderWidth: CGFloat?
    
    public init(
        foregroundColor: Color? = nil,
        backgroundColor: Color? = nil,
        tintColor: Color? = nil,
        titleFont: Font? = nil,
        bodyFont: Font? = nil,
        padding: EdgeInsets? = nil,
        horizontalPadding: CGFloat? = nil,
        backgroundMaterial: Material? = nil,
        backgroundShape: BackgroundShape? = nil,
        shadowColor: Color? = nil,
        shadowRadius: CGFloat? = nil,
        shadowOpacity: Double? = nil,
        borderColor: Color? = nil,
        borderWidth: CGFloat? = nil
    ) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
        self.titleFont = titleFont
        self.bodyFont = bodyFont
        self.padding = padding
        self.horizontalPadding = horizontalPadding
        self.backgroundMaterial = backgroundMaterial
        self.backgroundShape = backgroundShape
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
}

/// Background shape options for toasts
public enum BackgroundShape {
    case capsule
    case roundedRectangle(cornerRadius: CGFloat)
    case rectangle
}

/// Helper to create a shape from BackgroundShape
extension BackgroundShape {
    func create() -> AnyShape {
        switch self {
        case .capsule:
            return AnyShape(Capsule())
        case .roundedRectangle(let radius):
            return AnyShape(RoundedRectangle(cornerRadius: radius))
        case .rectangle:
            return AnyShape(Rectangle())
        }
    }
}

