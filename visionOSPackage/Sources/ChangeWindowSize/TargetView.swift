import SwiftUI

struct TargetView: View {
    enum Mode {
        case min
        case max
    }

    init() {}

    @State var mode: Mode = .min

    var size: CGSize {
        switch mode {
        case .min:
                .init(width: 500, height: 500)
        case .max:
                .init(width: 2700, height: 1360)
        }
    }

    var body: some View {
        VStack(alignment: .center) {
            Text("New Window View")

            Button {
                withAnimation {
                    if mode == .min {
                        mode = .max
                    } else {
                        mode = .min
                    }
                }
            } label: {
                Text("Change Window Size")
            }
        }
        .frame(
            minWidth: size.width,
            minHeight: size.height
        )
    }
}
