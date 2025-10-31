//
//  PassthroughWindow.swift
//  Toasty
//
//  Created by Toasty Package
//

#if os(iOS)
import UIKit

/// A pass-through UIWindow that allows touches to pass through to views underneath
/// unless they hit a toast view
internal class PassthroughWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let hitView = super.hitTest(point, with: event),
                let rootView = rootViewController?.view
        else { return nil }
        
        if #available(iOS 26, *) {
            if rootView.layer.hitTest(point)?.name == nil {
                return rootView
            } else {
                return nil
            }
        } else {
            if #available(iOS 18, *) {
                for subview in rootView.subviews.reversed() {
                    /// Finding if any of rootview's is receiving hit test
                    let pointInSubView = subview.convert(point, from: rootView)
                    if subview.hitTest(pointInSubView, with: event) != nil {
                        return hitView
                    }
                }
                
                return nil
            } else {
                return hitView == rootView ? nil : hitView
            }
        }
    }
}
#endif

