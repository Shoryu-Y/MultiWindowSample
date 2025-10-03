import SwiftUI

public struct CustomWindowControlsView: View {
    public init() {}

    public var body: some View {
        GeometryReader { proxy in
            Text("ここに注目！")
                .font(.largeTitle)
                .padding(.leading, proxy.containerCornerInsets.topLeading.width)
                .animation(.default, value: proxy.containerCornerInsets)

//            Rectangle()
//                .fill(.red)
//                .frame(
//                    width: proxy.containerCornerInsets.topLeading.width,
//                    height: proxy.containerCornerInsets.topLeading.height
//                    + proxy.safeAreaInsets.top
//                )
//                .animation(.default, value: proxy.safeAreaInsets)
//                .ignoresSafeArea()
        }
    }
}

//        GeometryReader { proxy in
//            VStack {
//                ZStack(alignment: .topLeading) {
//                    Rectangle()
//                        .fill(.red)
//                        .frame(
//                            width: proxy.containerCornerInsets.topLeading.width,
//                            height: proxy.containerCornerInsets.topLeading.height
//                        )
//                        .ignoresSafeArea()
//                }
//            }
//        }

#Preview {
    CustomWindowControlsView()
}
