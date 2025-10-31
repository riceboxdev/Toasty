# Toasty

A powerful and highly configurable toast notification system for SwiftUI apps on iOS 17+.

## Features

- 🎨 **Fully Configurable** - Customize animations, positioning, styling, and behavior
- 🎯 **Global & Per-Toast Configuration** - Set defaults globally, override per toast
- 📦 **Pre-built Views** - Error, Success, Warning, and HUD-style toasts included
- 🎭 **Custom Views** - Create your own toast views with full flexibility
- 🔄 **Auto-dismiss** - Automatic dismissal with configurable timers
- 👆 **Swipe to Dismiss** - Interactive swipe gestures to dismiss toasts
- 📱 **Overlay Window** - Universal toast system that works across your entire app

## Installation

### Swift Package Manager

Add Toasty to your project using Xcode:
1. File → Add Package Dependencies
2. Enter the repository URL
3. Select the version you want to use

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/Toasty.git", from: "1.0.0")
]
```

## Quick Start

### 1. Wrap Your App with RootView

```swift
import SwiftUI
import Toasty

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            RootView {
                ContentView()
            }
        }
    }
}
```

### 2. Add Toasts from Any View

```swift
import SwiftUI
import Toasty

struct ContentView: View {
    @Environment(ToastManager.self) private var toastManager
    
    var body: some View {
        Button("Show Toast") {
            toastManager.add(Toast { id in
                Text("Hello, World!")
                    .padding()
                    .background(.regularMaterial, in: Capsule())
            })
        }
    }
}
```

## Example Project

An example iOS app is included in the `Examples/ToastyExample` directory demonstrating all Toasty features:

- **Pre-built Toasts**: Examples of Error, Success, Warning, and HUD toasts
- **Custom Toasts**: Simple and complex custom toast implementations
- **Real-world Scenarios**: Form validation, network requests, and file operations
- **Configuration Playground**: Interactive interface to test all configuration options

To run the example:

1. Open the `Examples/ToastyExample` directory
2. Create a new Xcode project or open an existing workspace
3. Add the Toasty package as a local dependency
4. Build and run on iOS 17+ simulator or device

The example app provides a comprehensive showcase of Toasty's capabilities and serves as a reference for implementation.

## Configuration

### Global Configuration

Configure default behavior for all toasts:

```swift
let config = ToastyConfiguration(
    animationDuration: 0.3,
    animationStyle: .snappy,
    position: .bottom,
    autoDismissDuration: 3.0,
    maxVisibleToasts: 5
)

RootView(configuration: config) {
    ContentView()
}
```

### Per-Toast Configuration

Override settings for individual toasts:

```swift
let appearance = ToastAppearance(
    tintColor: .blue,
    titleFont: .headline,
    backgroundColor: .systemBlue.opacity(0.1)
)

let behavior = ToastBehavior(
    autoDismissDuration: 5.0,
    swipeToDismissEnabled: true
)

toastManager.add(
    Toast(appearance: appearance, behavior: behavior) { id in
        MyCustomToastView(id: id)
    }
)
```

## Pre-built Toast Views

Toasty includes ready-to-use toast views:

### Error Toast

```swift
toastManager.add(Toast { id in
    ErrorToastView(
        id: id,
        message: "Something went wrong!",
        appearance: ToastAppearance(tintColor: .red),
        onDismiss: { toastId in
            toastManager.delete(toastId)
        }
    )
})
```

### Success Toast

```swift
toastManager.add(Toast { id in
    SuccessToastView(
        id: id,
        message: "Operation completed successfully!"
    )
})
```

### Warning Toast

```swift
toastManager.add(Toast { id in
    WarningToastView(
        id: id,
        message: "Please review your settings"
    )
})
```

### HUD Toast

```swift
toastManager.add(Toast { id in
    HUDToastView(
        id: id,
        message: "Connected to AirPods",
        icon: "airpods.pro"
    )
})
```

## Configuration Options

### ToastyConfiguration (Global)

- `animationDuration: Double` - Animation duration (default: 0.3)
- `animationExtraBounce: Double` - Extra bounce amount (default: 0)
- `animationStyle: AnimationStyle` - Animation style (.snappy, .bouncy, .smooth, .easeInOut, .spring)
- `stackSpacing: CGFloat` - Spacing between stacked toasts (default: 10)
- `stackOffsetMultiplier: CGFloat` - Offset multiplier for stacking (default: 15)
- `stackScaleMultiplier: CGFloat` - Scale multiplier for stacking (default: 0.1)
- `maxStackOffset: CGFloat` - Maximum stack offset (default: 30)
- `maxStackScale: CGFloat` - Maximum stack scale (default: 1)
- `backgroundMaterial: Material` - Background material when expanded (default: .ultraThinMaterial)
- `minimumDragDistance: CGFloat` - Minimum drag distance to start swipe (default: 30)
- `dismissThreshold: CGFloat` - Swipe distance to dismiss (default: 200)
- `position: ToastPosition` - Position on screen (.top or .bottom, default: .bottom)
- `autoDismissDuration: TimeInterval?` - Auto-dismiss duration, nil to disable (default: nil)
- `maxVisibleToasts: Int?` - Maximum visible toasts, nil for unlimited (default: nil)
- `horizontalPadding: CGFloat` - Horizontal padding (default: 25)
- `bottomPadding: CGFloat` - Bottom padding (default: 15)
- `insertionTransition: AnyTransition` - Insertion animation (default: .offset(y: 100))
- `removalTransition: AnyTransition` - Removal animation (default: .move(edge: .leading))

### ToastAppearance (Per-Toast)

- `foregroundColor: Color?` - Foreground text color
- `backgroundColor: Color?` - Background color
- `tintColor: Color?` - Tint/icon color
- `titleFont: Font?` - Title font
- `bodyFont: Font?` - Body text font
- `padding: EdgeInsets?` - Custom padding
- `horizontalPadding: CGFloat?` - Horizontal padding override
- `backgroundMaterial: Material?` - Background material
- `backgroundShape: BackgroundShape?` - Background shape (.capsule, .roundedRectangle, .rectangle)
- `shadowColor: Color?` - Shadow color
- `shadowRadius: CGFloat?` - Shadow radius
- `shadowOpacity: Double?` - Shadow opacity
- `borderColor: Color?` - Border color
- `borderWidth: CGFloat?` - Border width

### ToastBehavior (Per-Toast)

- `autoDismissDuration: TimeInterval?` - Auto-dismiss duration override
- `swipeToDismissEnabled: Bool` - Enable/disable swipe to dismiss (default: true)
- `animationDuration: Double?` - Animation duration override
- `animationStyle: AnimationStyle?` - Animation style override
- `insertionTransition: AnyTransition?` - Custom insertion transition
- `removalTransition: AnyTransition?` - Custom removal transition
- `minimumDragDistance: CGFloat?` - Minimum drag distance override
- `dismissThreshold: CGFloat?` - Dismiss threshold override

## API Reference

### ToastManager

```swift
// Add a toast
func add(_ toast: Toast, appearance: ToastAppearance? = nil, behavior: ToastBehavior? = nil)

// Delete a toast by ID
func delete(_ id: String)

// Clear all toasts
func clearAll()

// Configure global settings
func configure(_ configuration: ToastyConfiguration)
```

### Toast

```swift
init(
    id: String = UUID().uuidString,
    appearance: ToastAppearance? = nil,
    behavior: ToastBehavior? = nil,
    @ViewBuilder content: @escaping (String) -> some View
)
```

## Examples

### Custom Toast with Auto-Dismiss

```swift
let behavior = ToastBehavior(autoDismissDuration: 2.0)

toastManager.add(Toast(behavior: behavior) { id in
    HStack {
        Image(systemName: "checkmark.circle.fill")
            .foregroundColor(.green)
        Text("Saved!")
    }
    .padding()
    .background(.regularMaterial, in: Capsule())
})
```

### Toast at Top of Screen

```swift
let config = ToastyConfiguration(position: .top)

RootView(configuration: config) {
    ContentView()
}
```

### Disable Swipe to Dismiss

```swift
let behavior = ToastBehavior(swipeToDismissEnabled: false)

toastManager.add(Toast(behavior: behavior) { id in
    ImportantToastView(id: id)
})
```

## Requirements

- iOS 17.0+
- Swift 5.9+
- Xcode 15.0+

## License

MIT License

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

