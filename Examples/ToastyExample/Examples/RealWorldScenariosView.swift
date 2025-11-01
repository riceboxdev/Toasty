//
//  RealWorldScenariosView.swift
//  ToastyExample
//
//  Demonstrates real-world use cases for toasts
//

import SwiftUI
import Toasty

struct RealWorldScenariosView: View {
    @Environment(ToastManager.self) private var toastManager
    
    var body: some View {
        List {
            Section("Form Validation") {
                NavigationLink(destination: FormValidationExample()) {
                    HStack {
                        Image(systemName: "doc.text.fill")
                        Text("Login Form")
                    }
                }
            }
            
            Section("Network Requests") {
                Button("Simulate API Call") {
                    simulateAPICall()
                }
            }
            
            Section("File Operations") {
                Button("Simulate File Upload") {
                    simulateFileUpload()
                }
            }
            
            Section("Multi-step Process") {
                Button("Run Multi-step Demo") {
                    runMultiStepDemo()
                }
            }
        }
        .navigationTitle("Real-world Scenarios")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func simulateAPICall() {
        // Show loading toast
        let loadingId = UUID().uuidString
        toastManager.add(Toast(id: loadingId) { id in
            LoadingToastView(id: id, message: "Connecting to server...")
        })
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            toastManager.delete(loadingId)
            
            // Show success
            let behavior = ToastBehavior(autoDismissDuration: 2.0)
            toastManager.add(
                Toast(behavior: behavior) { id in
                    SuccessToastView(
                        id: id,
                        message: "Data loaded successfully"
                    )
                }
            )
        }
    }
    
    private func simulateFileUpload() {
        var progress = 0
        let uploadId = UUID().uuidString
        
        // Create progress toast
        toastManager.add(Toast(id: uploadId) { id in
            ProgressToastView(id: id, progress: progress)
        })
        
        // Simulate progress
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            progress += Int.random(in: 3...8)
            if progress >= 100 {
                timer.invalidate()
                
                // Complete
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    toastManager.delete(uploadId)
                    
                    let behavior = ToastBehavior(autoDismissDuration: 2.0)
                    toastManager.add(
                        Toast(behavior: behavior) { id in
                            SuccessToastView(
                                id: id,
                                message: "Upload complete!"
                            )
                        }
                    )
                }
            }
        }
        
        RunLoop.current.add(timer, forMode: .common)
    }
    
    private func runMultiStepDemo() {
        let steps = [
            ("Creating account", 1.0),
            ("Setting up profile", 1.5),
            ("Initializing workspace", 1.0),
            ("Complete!", 2.0)
        ]
        
        var currentIndex = 0
        var activeToastId: String?
        
        func showNextStep() {
            guard currentIndex < steps.count else { return }
            
            let (message, duration) = steps[currentIndex]
            currentIndex += 1
            
            // Dismiss previous
            if let id = activeToastId {
                toastManager.delete(id)
            }
            
            // Show new
            let newId = UUID().uuidString
            activeToastId = newId
            
            let behavior = ToastBehavior(
                autoDismissDuration: duration,
                swipeToDismissEnabled: false
            )
            
            let appearance = ToastAppearance(
                backgroundColor: currentIndex == steps.count ? .green.opacity(0.2) : .blue.opacity(0.2),
                tintColor: currentIndex == steps.count ? .green : .blue
            )
            
            toastManager.add(
                Toast(id: newId, appearance: appearance, behavior: behavior) { id in
                    HStack(spacing: 12) {
                        if currentIndex == steps.count {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        } else {
                            ProgressView()
                        }
                        Text(message)
                            .font(.headline)
                    }
                    .padding()
                    .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 15))
                }
            )
            
            // Schedule next
            if currentIndex < steps.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    showNextStep()
                }
            }
        }
        
        showNextStep()
    }
}

struct FormValidationExample: View {
    @Environment(ToastManager.self) private var toastManager
    @State private var email = ""
    @State private var password = ""
    @State private var isValidating = false
    
    var body: some View {
        Form {
            Section("Login") {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textContentType(.password)
            }
            
            Section {
                Button(isValidating ? "Validating..." : "Submit") {
                    validateAndSubmit()
                }
                .disabled(isValidating || email.isEmpty || password.isEmpty)
            }
        }
        .navigationTitle("Form Validation")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func validateAndSubmit() {
        isValidating = true
        
        // Clear any existing toasts
        toastManager.clearAll()
        
        // Validate email
        if !email.contains("@") {
            isValidating = false
            toastManager.add(Toast { id in
                ErrorToastView(
                    id: id,
                    message: "Please enter a valid email address",
                    onDismiss: { toastId in
                        toastManager.delete(toastId)
                    }
                )
            })
            return
        }
        
        // Validate password
        if password.count < 8 {
            isValidating = false
            toastManager.add(Toast { id in
                WarningToastView(
                    id: id,
                    message: "Password must be at least 8 characters",
                    onDismiss: { toastId in
                        toastManager.delete(toastId)
                    }
                )
            })
            return
        }
        
        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isValidating = false
            
            let behavior = ToastBehavior(autoDismissDuration: 2.0)
            toastManager.add(
                Toast(behavior: behavior) { id in
                    SuccessToastView(
                        id: id,
                        message: "Login successful!"
                    )
                }
            )
        }
    }
}

struct LoadingToastView: View {
    let id: String
    let message: String
    
    var body: some View {
        HStack(spacing: 12) {
            ProgressView()
                .tint(.white)
            Text(message)
                .foregroundColor(.white)
        }
        .padding()
        .background(.blue.gradient, in: RoundedRectangle(cornerRadius: 15))
    }
}

struct ProgressToastView: View {
    let id: String
    let progress: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "arrow.up.circle.fill")
                Text("Uploading file...")
            }
            
            ProgressView(value: Double(progress), total: 100.0)
            
            Text("\(progress)%")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    NavigationStack {
        RealWorldScenariosView()
    }
    .environment(ToastManager())
}

