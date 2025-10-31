//
//  ErrorToastView.swift
//  Toasty
//
//  Created by Toasty Package
//

import SwiftUI

/// Pre-built error toast view with red tint and error icon
public struct ErrorToastView: View {
    let id: String
    let message: String
    let appearance: ToastAppearance?
    let onDismiss: ((String) -> Void)?
    
    public init(
        id: String,
        message: String,
        appearance: ToastAppearance? = nil,
        onDismiss: ((String) -> Void)? = nil
    ) {
        self.id = id
        self.message = message
        self.appearance = appearance
        self.onDismiss = onDismiss
    }
    
    public var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "bolt.trianglebadge.exclamationmark")
                .font(appearance?.titleFont ?? .title3)
                .fontWeight(.semibold)
                .foregroundStyle(appearance?.tintColor ?? .red)
            
            Text(message)
                .font(appearance?.bodyFont ?? .callout)
                .foregroundStyle(appearance?.foregroundColor ?? .primary)
            
            Spacer(minLength: 0)
            
            if let onDismiss = onDismiss {
                Button {
                    onDismiss(id)
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                }
            }
        }
        .foregroundStyle(appearance?.foregroundColor ?? .primary)
        .padding(appearance?.padding ?? EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 12))
        .background {
            createBackground()
        }
        .padding(.horizontal, appearance?.horizontalPadding ?? 25)
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

