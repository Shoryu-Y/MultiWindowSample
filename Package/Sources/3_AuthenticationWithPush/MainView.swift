import SwiftUI

struct MainView: View {
    init() {}

    @Environment(\.pushWindow) private var pushWindow

    var body: some View {
        VStack(alignment: .center) {
            Text("MainView")

            Button {
                pushWindow(id: AuthScene.id)
            } label: {
                Text("ログアウト")
            }
        }
    }
}
