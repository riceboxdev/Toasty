//
//  HUDToastView.swift
//  Toasty
//
//  Created by Toasty Package
//

import SwiftUI
import UIKit

/// Pre-built HUD-style toast view (Apple-like)
public struct HUDToastView: View {
    let id: String
    let icon: String?
    let message: String
    let appearance: ToastAppearance?
    
    public init(
        id: String,
        message: String,
        icon: String? = nil,
        appearance: ToastAppearance? = nil
    ) {
        self.id = id
        self.message = message
        self.icon = icon
        self.appearance = appearance
    }
    
    public var body: some View {
        HStack(spacing: 12) {
            if let icon = icon {
                Image(systemName: icon)
                    .font(appearance?.titleFont ?? .callout)
                    .foregroundStyle(appearance?.tintColor ?? .primary)
            }
            
            Text(message)
                .font(appearance?.bodyFont ?? .callout)
                .foregroundStyle(appearance?.foregroundColor ?? .primary)
        }
        .foregroundStyle(appearance?.foregroundColor ?? .primary)
        .padding(appearance?.padding ?? EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
        .background {
            createBackground()
        }
    }
    
    @ViewBuilder
    private func createBackground() -> some View {
        let shape = appearance?.backgroundShape ?? .capsule
        
        switch shape {
        case .capsule:
            Capsule()
                .fill(appearance?.backgroundColor ?? .gray.opacity(0.3))
                .shadow(
                    color: appearance?.shadowColor ?? .black.opacity(appearance?.shadowOpacity ?? 0.06),
                    radius: appearance?.shadowRadius ?? 3,
                    x: -1,
                    y: -3
                )
                .shadow(
                    color: appearance?.shadowColor ?? .black.opacity(appearance?.shadowOpacity ?? 0.06),
                    radius: appearance?.shadowRadius ?? 2,
                    x: 1,
                    y: 3
                )
        case .roundedRectangle(let radius):
            RoundedRectangle(cornerRadius: radius)
                .fill(appearance?.backgroundColor ?? .gray.opacity(0.3))
                .shadow(
                    color: appearance?.shadowColor ?? .black.opacity(appearance?.shadowOpacity ?? 0.06),
                    radius: appearance?.shadowRadius ?? 3,
                    x: -1,
                    y: -3
                )
                .shadow(
                    color: appearance?.shadowColor ?? .black.opacity(appearance?.shadowOpacity ?? 0.06),
                    radius: appearance?.shadowRadius ?? 2,
                    x: 1,
                    y: 3
                )
        case .rectangle:
            Rectangle()
                .fill(appearance?.backgroundColor ?? .gray.opacity(0.3))
                .shadow(
                    color: appearance?.shadowColor ?? .black.opacity(appearance?.shadowOpacity ?? 0.06),
                    radius: appearance?.shadowRadius ?? 3,
                    x: -1,
                    y: -3
                )
                .shadow(
                    color: appearance?.shadowColor ?? .black.opacity(appearance?.shadowOpacity ?? 0.06),
                    radius: appearance?.shadowRadius ?? 2,
                    x: 1,
                    y: 3
                )
        }
    }
}

