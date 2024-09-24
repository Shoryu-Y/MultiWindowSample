import SwiftUI

public struct AuthView: View {
    public init() {}

    @Environment(\.pushWindow) private var pushWindow

    public var body: some View {
        VStack(alignment: .center) {
            Text("AuthView")

            Button {
                pushWindow(id: MainScene.id)
            } label: {
                Text("ログイン")
            }
        }
    }
}
