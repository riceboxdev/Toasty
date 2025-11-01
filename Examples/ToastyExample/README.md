# Toasty Example App

This example app demonstrates all features of the Toasty toast notification system for SwiftUI.

## Setup

### Quick Start - Open the Xcode Project

Simply open the pre-configured Xcode project:

```bash
open Examples/ToastyExample.xcodeproj
```

The project is already configured with:
- ✅ Toasty package dependency linked
- ✅ All example files included
- ✅ Proper iOS 17.0 deployment target
- ✅ iPhone 16 simulator ready to use

### Option 1: Add to Existing Xcode Project

1. Open your Xcode project
2. Drag the `Examples/ToastyExample` folder into your project
3. Add the Toasty package dependency

### Option 2: Create New Xcode Project

1. Create a new iOS App project in Xcode
2. Set the minimum deployment target to iOS 17.0
3. Add the Toasty package as a local dependency
4. Copy the example files from `Examples/ToastyExample` into your project

### Adding Toasty as a Local Dependency

1. In Xcode, go to File → Add Package Dependencies
2. Click "Add Local..." 
3. Navigate to the root of the Toasty package and select it
4. Add the Toasty library to your target

## Features Demonstrated

### Pre-built Toasts
- Success, Error, Warning, and HUD toast examples
- Various styling options and configurations
- Auto-dismiss and manual dismiss examples
- Stacking multiple toasts

### Custom Toasts
- Simple custom toast implementations
- Complex toasts with images, buttons, and actions
- Animated custom toasts
- Gradient and styled custom toasts

### Real-world Scenarios
- **Form Validation**: Login form with error handling
- **Network Requests**: Simulated API calls with loading states
- **File Operations**: Progress tracking for uploads
- **Multi-step Processes**: Sequential toast notifications

### Configuration Playground
Interactive interface to test:
- Position (top/bottom)
- Animation styles and durations
- Auto-dismiss settings
- Stacking behavior
- Swipe gesture configuration

## Running the Example

1. Build the project (⌘+B)
2. Run on iOS 17+ simulator or device (⌘+R)
3. Navigate through different example sections
4. Test the configuration playground to experiment with settings

## Project Structure

```
Examples/ToastyExample/
├── ToastyExampleApp.swift       # App entry point
├── ContentView.swift            # Main navigation
├── Examples/
│   ├── PrebuiltToastsView.swift      # Pre-built examples
│   ├── CustomToastsView.swift        # Custom toast examples
│   ├── RealWorldScenariosView.swift  # Real-world scenarios
│   └── PlaygroundView.swift          # Configuration playground
├── Assets.xcassets/             # App assets
└── README.md                    # This file
```

## Requirements

- iOS 17.0+
- Swift 5.9+
- Xcode 15.0+

