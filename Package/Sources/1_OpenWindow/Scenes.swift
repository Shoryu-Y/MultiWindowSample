import Common
import SwiftUI

public struct TargetSceneWithID: Scene {
    public static let id: String = "TargetSceneWithID"

    public init() {}

    public var body: some Scene {
        WindowGroup(id: TargetSceneWithID.id) {
            TargetView()
        }
    }
}

public struct TargetSceneWithValue: Scene {
    public struct SceneValue: Codable, Hashable {
        let anything: String

        public init(anything: String) {
            self.anything = anything
        }
    }

    public static let id: String = "TargetSceneWithValue"

    public init() {}

    public var body: some Scene {
        WindowGroup(for: SceneValue.self) { value in
            TargetView()
        }
    }
}

public struct TargetSceneWithUserInteraction: Scene {
    public static let activityType = "dev.shoryu.MultiWindowExample.openWindow"
    public static let targetContentIdentifier = "TargetSceneWithUserInteraction"

    public struct Hoge: Codable {
        let foo: String
        let bar: Int
    }

    public static func userActivity(hoge: Hoge? = nil) -> NSUserActivity {
        let userActivity = NSUserActivity(activityType: TargetSceneWithUserInteraction.activityType)
        userActivity.targetContentIdentifier = TargetSceneWithUserInteraction.targetContentIdentifier
        if let hoge, let encodedHoge = try? JSONEncoder().encode(hoge) {
            userActivity.userInfo = ["hoge": encodedHoge]
        }

        return userActivity
    }

    public struct SceneView: View {
        @State var hoge: Hoge?

        public var body: some View {
            TargetView()
                .handlesExternalEvents(preferring: [], allowing: [])
                .onContinueUserActivity(TargetSceneWithUserInteraction.activityType) { activity in
                    if let hogeData = activity.userInfo?["hoge"] as? Data,
                       let hoge = try? JSONDecoder().decode(Hoge.self, from: hogeData)
                    {
                        self.hoge = hoge
                    }
                }
        }
    }

    public init() {}

    public var body: some Scene {
        WindowGroup {
            SceneView()
        }
        .handlesExternalEvents(matching: [Self.targetContentIdentifier])
    }
}
