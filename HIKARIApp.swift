import SwiftUI

@main
struct HIKARIApp: App {
    @StateObject private var library = LibraryManager()
    @StateObject private var settings = SettingsManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(library)
                .environmentObject(settings)
                .frame(minWidth: 900, minHeight: 600)
        }
        .commands {
            CommandMenu("Emulation") {
                Button("Fast Forward") { print("Fast Forward Triggered") }
                    .keyboardShortcut("f", modifiers: [.command, .option])
            }
        }
        
        Settings {
            SettingsView().environmentObject(settings)
        }
    }
}
