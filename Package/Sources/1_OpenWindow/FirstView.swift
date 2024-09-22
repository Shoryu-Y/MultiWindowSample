import SwiftUI

public struct FirstView: View {
    public init() {}

    @Environment(\.openWindow) private var openWindow
    @Environment(\.pushWindow) private var pushWindow

    public var body: some View {
        VStack(spacing: 16) {
            Text("First View")

            Button {
                openWindow(id: TargetSceneWithID.id)

//                openWindow(
//                    value: TargetSceneWithValue.SceneValue(anything: "hoge")
//                )
            } label: {
                Text("Open window")
            }

            Button {
                pushWindow(id: TargetSceneWithID.id)

//                openWindow(
//                    value: TargetSceneWithValue.SceneValue(anything: "hoge")
//                )
            } label: {
                Text("Push window")
            }

            Text("Drag & drop this")
                .hoverEffect()
                .onDrag {
                    NSItemProvider(object: TargetSceneWithUserInteraction.userActivity())
                }
        }
    }
}
