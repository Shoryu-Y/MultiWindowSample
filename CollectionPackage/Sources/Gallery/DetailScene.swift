import SwiftUI

public struct DetailScene: Scene {
    public init() {}

    public var body: some Scene {
        WindowGroup(for: Yukumo.self) { $yukumo in
            if let yukumo {
                Image(yukumo.resource)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .navigationTitle(yukumo.title)
                    .ignoresSafeArea()
            }
        }
    }
}

public struct DetailSceneWithUserActivity: Scene {
    static let activityType = "dev.shoryu.Gallery.openIllust"
    static let targetContentIdentifier = "DetailView"

    static func userActivity(yukumo: Yukumo) -> NSUserActivity {
        let userActivity = NSUserActivity(activityType: Self.activityType)
        userActivity.targetContentIdentifier = Self.targetContentIdentifier
        userActivity.userInfo = ["yukumo": yukumo.rawValue]
        return userActivity
    }

    public init() {}

    @State var yukumo: Yukumo?

    public var body: some Scene {
        WindowGroup(id: Self.activityType) {
            VStack {
                if let yukumo {
                    Image(yukumo.resource)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .navigationTitle(yukumo.title)
                }
            }
            .ignoresSafeArea()
            .handlesExternalEvents(preferring: [], allowing: [])
            .onContinueUserActivity(Self.activityType) { activity in
                if let rawValue = activity.userInfo?["yukumo"] as? String, let yukumo = Yukumo(rawValue: rawValue) {
                    self.yukumo = yukumo
                }
            }
        }
        .handlesExternalEvents(matching: [Self.targetContentIdentifier])
    }
}
