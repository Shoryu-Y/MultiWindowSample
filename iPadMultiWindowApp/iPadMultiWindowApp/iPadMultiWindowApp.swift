import SwiftUI
import Gallery
import WindowControls

@main
struct iPadMultiWindowApp: App {
    var body: some Scene {
        WindowGroup {
            CustomWindowControlsView()
        }

        Gallery.DetailScene()

        Gallery.DetailSceneWithUserActivity()
    }
}

struct ContentView: View {
    @Environment(\.openWindow) var openWindow

    var body: some View {
        Button("新しいウィンドウを開く") {
            openWindow(id: "ID")
        }
    }
}
