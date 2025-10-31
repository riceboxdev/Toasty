# Quick Setup Guide for Toasty Example App

## Problem: "Cannot preview in this file" Error

This error occurs because the example files need to be part of an Xcode project or scheme to be built and previewed.

## Solution: Create an Xcode Project

### Step-by-Step Instructions

1. **Open Xcode** (not just the Package.swift)

2. **Create a New Project:**
   - File → New → Project (or ⌘+Shift+N)
   - Select "iOS" → "App"
   - Click "Next"

3. **Configure the Project:**
   - Product Name: `ToastyExample`
   - Team: Your development team
   - Organization Identifier: (e.g., `com.yourname`)
   - Interface: SwiftUI
   - Language: Swift
   - **Important:** Minimum Deployment: iOS 17.0
   - Uncheck "Include Tests" (optional)
   - Click "Next"

4. **Save Location:**
   - Navigate to `/Users/nickrogers/DEV/Packages/Toasty/Examples/`
   - Make sure "Create Git repository" is checked if you want version control
   - Click "Create"

5. **Add Toasty Package Dependency:**
   - In Xcode, go to File → Add Package Dependencies...
   - Click "Add Local..."
   - Navigate to: `/Users/nickrogers/DEV/Packages/Toasty`
   - Select the Toasty folder and click "Add Package"
   - Make sure Toasty is added to your ToastyExample target
   - Click "Add Package"

6. **Add Example Files:**
   - Delete the default `ContentView.swift` and `ToastyExampleApp.swift` that Xcode created
   - In Finder, navigate to the `ToastyExample` folder
   - Select all the Swift files and the Assets.xcassets folder
   - Drag them into your Xcode project
   - Make sure "Copy items if needed" is checked
   - Make sure "Add to targets: ToastyExample" is checked
   - Click "Finish"

7. **Build and Run:**
   - Select a simulator (iPhone 15 Pro recommended)
   - Click Run (⌘+R) or Product → Run

8. **Now Previews Work:**
   - Open any Swift file
   - Click the canvas or press ⌘+Option+Return to see previews

## Alternative: Open Package in Xcode

If you just opened the Package.swift file in Xcode without creating a project:

1. File → Close Window
2. Follow steps 1-8 above to create a proper Xcode project

## Verify Setup

Once set up correctly:
- You should see "ToastyExample" as the scheme in Xcode's toolbar
- Running the app should show the example navigation
- Preview mode should work on all Swift files
- You should be able to build without errors

## Troubleshooting

**Build errors about missing Toasty module:**
- Make sure you added Toasty as a package dependency
- Go to Project Settings → ToastyExample target → General → Frameworks, Libraries, and Embedded Content
- Verify Toasty appears in the list

**Preview still doesn't work:**
- Make sure the scheme is set to ToastyExample (not Toasty-Package)
- Try Product → Clean Build Folder (⌘+Shift+K)
- Restart Xcode

**Files show red in project navigator:**
- Make sure the files were copied into the Xcode project folder
- Check that all files have the ToastyExample target selected in File Inspector

