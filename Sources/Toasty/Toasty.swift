//
//  Toasty.swift
//  Toasty
//
//  Created by Toasty Package
//

import SwiftUI

/// Main Toasty module - provides toast notification system for SwiftUI apps
/// 
/// ## Usage
/// 
/// ```swift
/// @main
/// struct MyApp: App {
///     var body: some Scene {
///         WindowGroup {
///             RootView {
///                 ContentView()
///             }
///         }
///     }
/// }
/// ```
/// 
/// ```swift
/// struct ContentView: View {
///     @Environment(ToastManager.self) private var toastManager
///     
///     var body: some View {
///         Button("Show Toast") {
///             toastManager.add(Toast { id in
///                 Text("Hello, World!")
///                     .padding()
///                     .background(.regularMaterial, in: Capsule())
///             })
///         }
///     }
/// }
/// ```
///
@_exported import SwiftUI

