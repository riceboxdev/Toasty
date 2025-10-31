//
//  ToastManager.swift
//  Toasty
//
//  Created by Toasty Package
//

import SwiftUI
import Observation

/// Observable manager for toast messages
@Observable
public class ToastManager {
    /// All active toasts
    internal var toasts: [Toast] = []
    
    /// Global configuration
    public var configuration: ToastyConfiguration
    
    /// Auto-dismiss timers (keyed by toast ID)
    private var dismissTimers: [String: Timer] = [:]
    
    public init(configuration: ToastyConfiguration = ToastyConfiguration()) {
        self.configuration = configuration
    }
    
    /// Adds a toast to the display
    /// - Parameters:
    ///   - toast: The toast to add
    ///   - appearance: Optional appearance override (overrides toast's appearance if provided)
    ///   - behavior: Optional behavior override (overrides toast's behavior if provided)
    public func add(
        _ toast: Toast,
        appearance: ToastAppearance? = nil,
        behavior: ToastBehavior? = nil
    ) {
        var toastToAdd = toast
        
        // Apply overrides
        if let appearance = appearance {
            toastToAdd.appearance = appearance
        }
        if let behavior = behavior {
            toastToAdd.behavior = behavior
        }
        
        // Apply max visible toasts limit
        if let maxVisible = configuration.maxVisibleToasts,
           toasts.count >= maxVisible {
            // Remove oldest toast
            if let oldestToast = toasts.first {
                delete(oldestToast.id)
            }
        }
        
        withAnimation(configuration.animation()) {
            toasts.append(toastToAdd)
        }
        
        // Setup auto-dismiss if configured
        setupAutoDismiss(for: toastToAdd)
    }
    
    /// Removes a toast from the display
    /// - Parameter id: The ID of the toast to remove
    public func delete(_ id: String) {
        // Cancel any auto-dismiss timer
        dismissTimers[id]?.invalidate()
        dismissTimers.removeValue(forKey: id)
        
        @Bindable var bindable = self
        if let toast = $bindable.toasts.first(where: { $0.id == id }) {
            toast.wrappedValue.isDeleting.toggle()
        }
        
        withAnimation(configuration.animation()) {
            toasts.removeAll(where: { $0.id == id })
        }
    }
    
    /// Removes all toasts
    public func clearAll() {
        // Cancel all timers
        dismissTimers.values.forEach { $0.invalidate() }
        dismissTimers.removeAll()
        
        withAnimation(configuration.animation()) {
            toasts.removeAll()
        }
    }
    
    /// Configures the global toast settings
    /// - Parameter configuration: The new configuration
    public func configure(_ configuration: ToastyConfiguration) {
        self.configuration = configuration
    }
    
    // MARK: - Private Methods
    
    private func setupAutoDismiss(for toast: Toast) {
        // Determine dismiss duration (behavior override > global config)
        let dismissDuration = toast.behavior?.autoDismissDuration ?? configuration.autoDismissDuration
        
        guard let duration = dismissDuration, duration > 0 else {
            return
        }
        
        let timer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { [weak self] _ in
            self?.delete(toast.id)
        }
        
        dismissTimers[toast.id] = timer
    }
}

