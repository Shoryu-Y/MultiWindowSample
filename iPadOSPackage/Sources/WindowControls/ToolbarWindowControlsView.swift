import SwiftUI

public struct ToolbarWindowControlsView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            Text("↖︎左上に注目")
                .font(.largeTitle)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("1")
                    }

                    ToolbarSpacer(placement: .topBarLeading)

                    ToolbarItem(placement: .topBarLeading) {
                        Text("2")
                    }

                    ToolbarSpacer(placement: .topBarLeading)

                    ToolbarItem(placement: .topBarLeading) {
                        Text("3")
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        Image(systemName: "ellipsis")
                    }
                }
        }
    }
}

#Preview {
    ToolbarWindowControlsView()
}
