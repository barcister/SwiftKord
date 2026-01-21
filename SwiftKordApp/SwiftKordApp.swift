import SwiftUI

@main
struct SwiftKordApp: App {
    @State private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appState)
                .tint(Theme.accent)
        }
        #if os(visionOS)
        .windowStyle(.volumetric)
        #endif
    }
}
