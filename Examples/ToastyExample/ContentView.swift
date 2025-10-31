//
//  ContentView.swift
//  ToastyExample
//
//  Main navigation view showing all examples
//

import SwiftUI
import Toasty

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Examples") {
                    NavigationLink(destination: PrebuiltToastsView()) {
                        HStack {
                            Image(systemName: "square.stack.3d.up.fill")
                            Text("Pre-built Toasts")
                        }
                    }
                    
                    NavigationLink(destination: CustomToastsView()) {
                        HStack {
                            Image(systemName: "paintbrush.fill")
                            Text("Custom Toasts")
                        }
                    }
                    
                    NavigationLink(destination: RealWorldScenariosView()) {
                        HStack {
                            Image(systemName: "globe")
                            Text("Real-world Scenarios")
                        }
                    }
                }
                
                Section("Interactive") {
                    NavigationLink(destination: PlaygroundView()) {
                        HStack {
                            Image(systemName: "slider.horizontal.3")
                            Text("Configuration Playground")
                        }
                    }
                }
            }
            .navigationTitle("Toasty Examples")
        }
    }
}

#Preview {
    ContentView()
}

