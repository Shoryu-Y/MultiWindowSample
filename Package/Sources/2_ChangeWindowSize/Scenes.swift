import Common
import SwiftUI

public struct TargetSceneWithDefaultSize: Scene {
    static let id: String = "TargetSceneWithDefaultSize"

    public init() {}

    public var body: some Scene {
        WindowGroup(id: Self.id) {
            TargetView()
        }
        .defaultSize(width: 1000, height: 1000)
    }
}

public struct TargetSceneWithResizability: Scene {
    static let id: String = "TargetSceneWithResizability"

    public init() {}

    public var body: some Scene {
        WindowGroup(id: Self.id) {
            TargetView()
        }
        .windowResizability(.contentSize)
//        .defaultWindowPlacement { root, context in
//            if let window = context.windows.first {
//                return .init(.leading(window))
//            }
//
//            return .init()
//        }
    }
}
