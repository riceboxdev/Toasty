//
//  RootView.swift
//  Toasty
//
//  Created by Toasty Package
//

import SwiftUI

#if os(iOS)
import UIKit

/// Root view wrapper that creates the toast overlay window
/// Place this at your app's root view
public struct RootView<Content: View>: View {
    var content: Content
    private let configuration: ToastyConfiguration?
    
    @State private var overlayWindow: UIWindow?
    @State private var toastManager: ToastManager
    
    /// Initializes the root view with optional global configuration
    /// - Parameters:
    ///   - configuration: Optional global configuration for all toasts
    ///   - content: The main content view
    public init(
        configuration: ToastyConfiguration? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content()
        self.configuration = configuration
        self._toastManager = State(initialValue: ToastManager(configuration: configuration ?? ToastyConfiguration()))
    }
    
    public var body: some View {
        content
            .environment(toastManager)
            .onAppear {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, overlayWindow == nil {
                    let window = PassthroughWindow(windowScene: windowScene)
                    window.backgroundColor = .clear
                    
                    // View Controller
                    let rootController = UIHostingController(rootView: ToastsView().environment(toastManager))
                    rootController.view.frame = windowScene.keyWindow?.frame ?? .zero
                    rootController.view.backgroundColor = .clear
                    window.rootViewController = rootController
                    window.isHidden = false
                    window.isUserInteractionEnabled = true
                    window.tag = 1009
                    
                    overlayWindow = window
                }
            }
    }
}
#endif

