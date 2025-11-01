//
//  CustomToastsView.swift
//  ToastyExample
//
//  Demonstrates custom toast views
//

import SwiftUI
import Toasty

struct CustomToastsView: View {
    @Environment(ToastManager.self) private var toastManager
    
    var body: some View {
        List {
            Section("Simple Custom Toasts") {
                Button("Basic Custom Toast") {
                    toastManager.add(Toast { id in
                        Text("Hello, World!")
                            .padding()
                            .background(.regularMaterial, in: Capsule())
                    })
                }
                
                Button("Colored Custom Toast") {
                    toastManager.add(Toast { id in
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("Custom styled toast!")
                        }
                        .padding()
                        .background(
                            Capsule()
                                .fill(.blue.gradient)
                        )
                        .foregroundColor(.white)
                    })
                }
                
                Button("Gradient Toast") {
                    toastManager.add(Toast { id in
                        Text("Beautiful gradient")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                LinearGradient(
                                    colors: [.purple, .pink],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                in: RoundedRectangle(cornerRadius: 20)
                            )
                    })
                }
            }
            
            Section("Complex Custom Toasts") {
                Button("Toast with Title and Message") {
                    toastManager.add(Toast { id in
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Update Available")
                                .font(.headline)
                            Text("A new version of the app is available for download")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 15))
                    })
                }
                
                Button("Toast with Action Button") {
                    let toastId = UUID().uuidString
                    toastManager.add(Toast(id: toastId) { id in
                        HStack(spacing: 15) {
                            Image(systemName: "bell.badge.fill")
                                .foregroundColor(.blue)
                            
                            Text("New notification")
                                .font(.headline)
                            
                            Button("View") {
                                toastManager.delete(id)
                                // Handle action
                            }
                            .buttonStyle(.bordered)
                            .controlSize(.small)
                        }
                        .padding()
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 15))
                    })
                }
                
                Button("Image Toast") {
                    toastManager.add(Toast { id in
                        HStack(spacing: 12) {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.blue)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("John Doe")
                                    .font(.headline)
                                Text("Sent you a message")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 15))
                    })
                }
            }
            
            Section("Animated Custom Toasts") {
                Button("Pulsing Toast") {
                    toastManager.add(Toast { id in
                        PulsingToastView(text: "Processing...")
                    })
                }
                
                Button("Bounce In Toast") {
                    toastManager.add(
                        Toast(
                            behavior: ToastBehavior(
                                animationDuration: 0.5,
                                animationStyle: .bouncy
                            )
                        ) { id in
                            Text("Bounce animation!")
                                .font(.headline)
                                .padding()
                                .background(.green.gradient, in: RoundedRectangle(cornerRadius: 15))
                                .foregroundColor(.white)
                        }
                    )
                }
            }
            
            Section("Configured Custom Toasts") {
                Button("Custom Appearance") {
                    let appearance = ToastAppearance(
                        foregroundColor: .white,
                        backgroundColor: .blue,
                        padding: EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20),
                        backgroundShape: .roundedRectangle(cornerRadius: 12),
                        shadowColor: .blue.opacity(0.5),
                        shadowRadius: 10
                    )
                    
                    toastManager.add(
                        Toast(appearance: appearance) { id in
                            Text("Custom appearance applied")
                        }
                    )
                }
                
                Button("Disable Swipe to Dismiss") {
                    let behavior = ToastBehavior(
                        autoDismissDuration: 5.0,
                        swipeToDismissEnabled: false
                    )
                    
                    toastManager.add(
                        Toast(behavior: behavior) { id in
                            Text("Swipe disabled - will auto-dismiss")
                                .padding()
                                .background(.regularMaterial, in: Capsule())
                        }
                    )
                }
            }
        }
        .navigationTitle("Custom Toasts")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PulsingToastView: View {
    let text: String
    @State private var isPulsing = false
    
    var body: some View {
        HStack(spacing: 10) {
            Circle()
                .fill(.blue)
                .frame(width: 12, height: 12)
                .scaleEffect(isPulsing ? 1.2 : 1.0)
                .opacity(isPulsing ? 0.5 : 1.0)
                .animation(
                    Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true),
                    value: isPulsing
                )
                .onAppear {
                    isPulsing = true
                }
            
            Text(text)
        }
        .padding()
        .background(.regularMaterial, in: Capsule())
    }
}

#Preview {
    NavigationStack {
        CustomToastsView()
    }
    .environment(ToastManager())
}

