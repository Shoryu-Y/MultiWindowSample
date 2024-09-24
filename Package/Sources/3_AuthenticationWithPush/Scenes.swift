import Common
import SwiftUI

public struct AuthScene: Scene {
    static let id: String = "AuthScene"

    public init() {}

    @Environment(\.dismissWindow) private var dismissWindow

    public var body: some Scene {
        WindowGroup(id: Self.id) {
            AuthView()
                .onAppear {
                    Task {
                        try? await Task.sleep(nanoseconds: 1_000_000_000)
                        dismissWindow(id: MainScene.id)
                    }
                }
        }
    }
}

public struct MainScene: Scene {
    static let id: String = "MainScene"

    public init() {}

    @Environment(\.dismissWindow) private var dismissWindow

    public var body: some Scene {
        WindowGroup(id: Self.id) {
            MainView()
                .onAppear {
                    Task {
                        try? await Task.sleep(nanoseconds: 1_000_000_000)
                        dismissWindow(id: AuthScene.id)
                    }
                }
        }
    }
}
