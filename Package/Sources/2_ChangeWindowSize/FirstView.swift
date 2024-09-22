import SwiftUI

public struct FirstView: View {
    public init() {}

    @Environment(\.openWindow) private var openWindow

    public var body: some View {
        VStack(spacing: 16) {
            Text("First View")

            Button {
                openWindow(id: TargetSceneWithDefaultSize.id)
//                openWindow(id: TargetSceneWithResizability.id)
            } label: {
                Text("Open window")
            }
        }
    }
}
