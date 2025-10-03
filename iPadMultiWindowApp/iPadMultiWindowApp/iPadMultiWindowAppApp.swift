import SwiftUI

@main
struct iPadMultiWindowAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }

        WindowGroup(id: "1") {
            Text("ID: 1")
        }
    }
}

struct MainView: View {
    @Environment(\.openWindow) var openWindow

    var body: some View {
        Button("Open New Window") {
            openWindow(id: "1")
        }
    }
}
