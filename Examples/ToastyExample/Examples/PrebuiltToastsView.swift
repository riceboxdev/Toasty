//
//  PrebuiltToastsView.swift
//  ToastyExample
//
//  Demonstrates pre-built toast views (Error, Success, Warning, HUD)
//

import SwiftUI
import Toasty

struct PrebuiltToastsView: View {
    @Environment(ToastManager.self) private var toastManager
    
    var body: some View {
        List {
            Section("Success Toasts") {
                Button("Basic Success Toast") {
                    toastManager.add(Toast { id in
                        SuccessToastView(
                            id: id,
                            message: "Operation completed successfully!"
                        )
                    })
                }
                
                Button("Success with Auto-dismiss") {
                    let behavior = ToastBehavior(autoDismissDuration: 2.0)
                    toastManager.add(
                        Toast(behavior: behavior) { id in
                            SuccessToastView(
                                id: id,
                                message: "This will dismiss automatically"
                            )
                        }
                    )
                }
                
                Button("Styled Success Toast") {
                    let appearance = ToastAppearance(
                        tintColor: .green,
                        backgroundColor: .green.opacity(0.2),
                        backgroundShape: .roundedRectangle(cornerRadius: 20)
                    )
                    toastManager.add(
                        Toast(appearance: appearance) { id in
                            SuccessToastView(
                                id: id,
                                message: "Custom styled success toast"
                            )
                        }
                    )
                }
            }
            
            Section("Error Toasts") {
                Button("Basic Error Toast") {
                    toastManager.add(Toast { id in
                        ErrorToastView(
                            id: id,
                            message: "Something went wrong!",
                            onDismiss: { toastId in
                                toastManager.delete(toastId)
                            }
                        )
                    })
                }
                
                Button("Error with Dismiss Button") {
                    let appearance = ToastAppearance(
                        tintColor: .red,
                        backgroundColor: .red.opacity(0.15)
                    )
                    toastManager.add(
                        Toast(appearance: appearance) { id in
                            ErrorToastView(
                                id: id,
                                message: "Error with manual dismiss",
                                appearance: appearance,
                                onDismiss: { toastId in
                                    toastManager.delete(toastId)
                                }
                            )
                        }
                    )
                }
            }
            
            Section("Warning Toasts") {
                Button("Basic Warning Toast") {
                    toastManager.add(Toast { id in
                        WarningToastView(
                            id: id,
                            message: "Please review your settings"
                        )
                    })
                }
                
                Button("Yellow Warning Toast") {
                    let appearance = ToastAppearance(
                        tintColor: .orange,
                        backgroundColor: .orange.opacity(0.2)
                    )
                    toastManager.add(
                        Toast(appearance: appearance) { id in
                            WarningToastView(
                                id: id,
                                message: "Warning: Check your configuration"
                            )
                        }
                    )
                }
            }
            
            Section("HUD Toasts") {
                Button("Basic HUD Toast") {
                    toastManager.add(Toast { id in
                        HUDToastView(
                            id: id,
                            message: "Connected to AirPods",
                            icon: "airpods.pro"
                        )
                    })
                }
                
                Button("HUD with Custom Icon") {
                    toastManager.add(Toast { id in
                        HUDToastView(
                            id: id,
                            message: "Wi-Fi connected",
                            icon: "wifi"
                        )
                    })
                }
                
                Button("HUD without Icon") {
                    toastManager.add(Toast { id in
                        HUDToastView(
                            id: id,
                            message: "Simple HUD message"
                        )
                    })
                }
            }
            
            Section("Stack Multiple Toasts") {
                Button("Show 5 Toasts Quickly") {
                    for i in 1...5 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.2) {
                            toastManager.add(Toast { id in
                                HUDToastView(
                                    id: id,
                                    message: "Toast #\(i)"
                                )
                            })
                        }
                    }
                }
            }
        }
        .navigationTitle("Pre-built Toasts")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        PrebuiltToastsView()
    }
    .environment(ToastManager())
}

