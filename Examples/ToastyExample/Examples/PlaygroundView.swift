//
//  PlaygroundView.swift
//  ToastyExample
//
//  Interactive playground for testing toast configurations
//

import SwiftUI
import Toasty

struct PlaygroundView: View {
    @Environment(ToastManager.self) private var toastManager
    @State private var position: ToastPosition = .bottom
    @State private var animationStyle: AnimationStyle = .snappy
    @State private var animationDuration: Double = 0.3
    @State private var autoDismissEnabled = false
    @State private var autoDismissDuration: Double = 3.0
    @State private var maxToasts: Int? = 5
    @State private var swipeEnabled = true
    @State private var stackSpacing: Double = 10
    
    var body: some View {
        Form {
            Section("Position") {
                Picker("Position", selection: $position) {
                    Text("Bottom").tag(ToastPosition.bottom)
                    Text("Top").tag(ToastPosition.top)
                }
                .onChange(of: position) { oldValue, newValue in
                    applyConfiguration()
                }
            }
            
            Section("Animation") {
                Picker("Style", selection: $animationStyle) {
                    Text("Snappy").tag(AnimationStyle.snappy)
                    Text("Bouncy").tag(AnimationStyle.bouncy)
                    Text("Smooth").tag(AnimationStyle.smooth)
                    Text("Ease In Out").tag(AnimationStyle.easeInOut)
                    Text("Spring").tag(AnimationStyle.spring)
                }
                .onChange(of: animationStyle) { oldValue, newValue in
                    applyConfiguration()
                }
                
                VStack(alignment: .leading) {
                    Text("Duration: \(animationDuration, specifier: "%.2f")s")
                    Slider(value: $animationDuration, in: 0.1...1.0, step: 0.1)
                }
                .onChange(of: animationDuration) { oldValue, newValue in
                    applyConfiguration()
                }
            }
            
            Section("Auto-dismiss") {
                Toggle("Enabled", isOn: $autoDismissEnabled)
                    .onChange(of: autoDismissEnabled) { oldValue, newValue in
                        applyConfiguration()
                    }
                
                if autoDismissEnabled {
                    VStack(alignment: .leading) {
                        Text("Duration: \(autoDismissDuration, specifier: "%.1f")s")
                        Slider(value: $autoDismissDuration, in: 0.5...10.0, step: 0.5)
                    }
                    .onChange(of: autoDismissDuration) { oldValue, newValue in
                        applyConfiguration()
                    }
                }
            }
            
            Section("Stacking") {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Max Toasts")
                        Spacer()
                        TextField("Unlimited", value: $maxToasts, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                    }
                }
                .onChange(of: maxToasts) { oldValue, newValue in
                    applyConfiguration()
                }
                
                VStack(alignment: .leading) {
                    Text("Stack Spacing: \(stackSpacing, specifier: "%.0f")")
                    Slider(value: $stackSpacing, in: 5...50, step: 5)
                }
                .onChange(of: stackSpacing) { oldValue, newValue in
                    applyConfiguration()
                }
            }
            
            Section("Swipe Gesture") {
                Toggle("Enabled", isOn: $swipeEnabled)
                    .onChange(of: swipeEnabled) { oldValue, newValue in
                        applyConfiguration()
                    }
            }
            
            Section("Test") {
                Button("Show Test Toast") {
                    showTestToast()
                }
                
                Button("Show 5 Toasts") {
                    showMultipleToasts(count: 5)
                }
                
                Button("Clear All") {
                    toastManager.clearAll()
                }
            }
        }
        .navigationTitle("Configuration Playground")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            applyConfiguration()
        }
    }
    
    private func applyConfiguration() {
        let config = ToastyConfiguration(
            animationDuration: animationDuration,
            animationStyle: animationStyle,
            stackSpacing: stackSpacing,
            position: position,
            autoDismissDuration: autoDismissEnabled ? autoDismissDuration : nil,
            maxVisibleToasts: maxToasts
        )
        toastManager.configure(config)
    }
    
    private func showTestToast() {
        let behavior = ToastBehavior(
            autoDismissDuration: autoDismissEnabled ? autoDismissDuration : nil,
            swipeToDismissEnabled: swipeEnabled,
            animationDuration: animationDuration,
            animationStyle: animationStyle
        )
        
        toastManager.add(
            Toast(behavior: behavior) { id in
                VStack(spacing: 8) {
                    HStack {
                        Image(systemName: "slider.horizontal.3")
                        Text("Test Toast")
                            .font(.headline)
                    }
                    
                    HStack(spacing: 4) {
                        Label("Position: \(position == .bottom ? "Bottom" : "Top")", systemImage: "location")
                        Text("•")
                        Label("Animation: \(animationStyleName)", systemImage: "bolt")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
                .padding()
                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 15))
            }
        )
    }
    
    private func showMultipleToasts(count: Int) {
        for i in 1...count {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.15) {
                toastManager.add(Toast { id in
                    HStack {
                        Image(systemName: "\(i).circle.fill")
                            .foregroundColor(colors[i % colors.count])
                        Text("Toast #\(i)")
                    }
                    .padding()
                    .background(.regularMaterial, in: Capsule())
                })
            }
        }
    }
    
    private var animationStyleName: String {
        switch animationStyle {
        case .snappy: return "Snappy"
        case .bouncy: return "Bouncy"
        case .smooth: return "Smooth"
        case .easeInOut: return "Ease In Out"
        case .spring: return "Spring"
        }
    }
    
    private let colors: [Color] = [.blue, .green, .orange, .purple, .pink, .red]
}

#Preview {
    NavigationStack {
        PlaygroundView()
    }
    .environment(ToastManager())
}

