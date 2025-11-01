//
//  ToastsView.swift
//  Toasty
//
//  Created by Toasty Package
//

import SwiftUI
import Observation

internal struct ToastsView: View {
    @Environment(ToastManager.self) private var toastManager
    @State private var isExpanded: Bool = false
    @State private var height: CGFloat = .zero
    
    var body: some View {
        @Bindable var bindable = toastManager
        
        let alignment: Alignment = toastManager.configuration.position == .top ? .top : .bottom
        
        ZStack(alignment: alignment) {
            if isExpanded {
                Rectangle()
                    .fill(toastManager.configuration.backgroundMaterial)
                    .ignoresSafeArea()
            }
            
            let layout = isExpanded ? AnyLayout(VStackLayout(spacing: toastManager.configuration.stackSpacing)) : AnyLayout(ZStackLayout())
            
            ScrollView(.vertical) {
                layout {
                    ForEach($bindable.toasts) { $toast in
                        let index = (toasts.count - 1) - (toasts.firstIndex(where: { $0.id == toast.id }) ?? 0)
                        
                        // Get effective configuration for this toast
                        let effectiveBehavior = effectiveBehavior(for: toast)
                        let effectiveConfig = effectiveConfiguration(for: toast)
                        
                        Group {
                            if effectiveBehavior.swipeToDismissEnabled {
                                toast.content
                                    .offset(x: toast.offsetX)
                                    .gesture(createDragGesture(for: $toast, config: effectiveConfig))
                            } else {
                                toast.content
                            }
                        }
                            .visualEffect { [isExpanded] content, proxy in
                                content
                                    .scaleEffect(isExpanded ? 1 : scale(index, config: toastManager.configuration), anchor: alignment == .top ? .top : .bottom)
                                    .offset(y: isExpanded ? 0 : offsetY(index, config: toastManager.configuration, position: toastManager.configuration.position))
                            }
                            .zIndex(toast.isDeleting ? 1000 : 0)
                            .frame(maxWidth: .infinity)
                            .transition(
                                .asymmetric(
                                    insertion: effectiveBehavior.insertionTransition ?? effectiveConfig.insertionTransition,
                                    removal: effectiveBehavior.removalTransition ?? effectiveConfig.removalTransition
                                )
                            )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, toastManager.configuration.bottomPadding)
                .rotationEffect(.init(degrees: alignment == .top ? 0 : -180))
                .onGeometryChange(for: CGFloat.self) {
                    $0.size.height
                } action: { newValue in
                    height = newValue
                }
            }
            .rotationEffect(.init(degrees: alignment == .top ? 0 : 180))
            .frame(height: isExpanded ? nil : height == 0 ? nil : height)
            .scrollClipDisabled()
            .scrollIndicators(.hidden)
            .scrollDisabled(!isExpanded)
            .allowsHitTesting(!toasts.isEmpty)
            .onTapGesture {
                isExpanded.toggle()
            }
        }
        .ignoresSafeArea()
        .frame(maxHeight: .infinity, alignment: alignment)
        .animation(toastManager.configuration.animation(), value: isExpanded)
        .onChange(of: toasts.isEmpty) { oldValue, newValue in
            if newValue {
                isExpanded = false
            }
        }
    }
    
    // MARK: - Computed Properties
    
    private var toasts: [Toast] {
        toastManager.toasts
    }
    
    // MARK: - Helper Methods
    
    private func effectiveBehavior(for toast: Toast) -> ToastBehavior {
        var behavior = ToastBehavior()
        
        // Apply global config defaults
        behavior.swipeToDismissEnabled = true
        behavior.minimumDragDistance = toastManager.configuration.minimumDragDistance
        behavior.dismissThreshold = toastManager.configuration.dismissThreshold
        
        // Override with toast-specific behavior
        if let toastBehavior = toast.behavior {
            if let autoDismiss = toastBehavior.autoDismissDuration {
                behavior.autoDismissDuration = autoDismiss
            }
            behavior.swipeToDismissEnabled = toastBehavior.swipeToDismissEnabled
            if let animDuration = toastBehavior.animationDuration {
                behavior.animationDuration = animDuration
            }
            if let animStyle = toastBehavior.animationStyle {
                behavior.animationStyle = animStyle
            }
            if let insertion = toastBehavior.insertionTransition {
                behavior.insertionTransition = insertion
            }
            if let removal = toastBehavior.removalTransition {
                behavior.removalTransition = removal
            }
            if let minDrag = toastBehavior.minimumDragDistance {
                behavior.minimumDragDistance = minDrag
            }
            if let threshold = toastBehavior.dismissThreshold {
                behavior.dismissThreshold = threshold
            }
        }
        
        return behavior
    }
    
    private func effectiveConfiguration(for toast: Toast) -> ToastyConfiguration {
        var config = toastManager.configuration
        
        // Override with toast-specific behavior if it has animation settings
        if let behavior = toast.behavior {
            if let duration = behavior.animationDuration {
                config.animationDuration = duration
            }
            if let style = behavior.animationStyle {
                config.animationStyle = style
            }
            if let minDrag = behavior.minimumDragDistance {
                config.minimumDragDistance = minDrag
            }
            if let threshold = behavior.dismissThreshold {
                config.dismissThreshold = threshold
            }
        }
        
        return config
    }
    
    private func createDragGesture(for toast: Binding<Toast>, config: ToastyConfiguration) -> some Gesture {
        DragGesture(minimumDistance: config.minimumDragDistance, coordinateSpace: .global)
            .onChanged { value in
                let xOffset = -value.translation.width > config.minimumDragDistance ? value.translation.width + config.minimumDragDistance : 0
                toast.wrappedValue.offsetX = xOffset
            }
            .onEnded { value in
                let xOffset = value.translation.width + (value.velocity.width / 2)
                
                if -xOffset > config.dismissThreshold {
                    toastManager.delete(toast.wrappedValue.id)
                } else {
                    withAnimation(.bouncy) {
                        toast.wrappedValue.offsetX = 0
                    }
                }
            }
    }
    
    private func offsetY(_ index: Int, config: ToastyConfiguration, position: ToastPosition) -> CGFloat {
        let offset = min(CGFloat(index) * config.stackOffsetMultiplier, config.maxStackOffset)
        return position == .top ? offset : -offset
    }
    
    private func scale(_ index: Int, config: ToastyConfiguration) -> CGFloat {
        let scale = min(CGFloat(index) * config.stackScaleMultiplier, config.maxStackScale)
        return 1 - scale
    }
}

