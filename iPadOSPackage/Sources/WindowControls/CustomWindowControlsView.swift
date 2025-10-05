import SwiftUI

public struct CustomWindowControlsView: View {
    public init() {}

    public var body: some View {
        GeometryReader { proxy in

            ZStack {
                VStack {
                    Rectangle()
                        .fill(.blue)
                        .frame(
                            width: proxy.size.width,
                            height: proxy.safeAreaInsets.top
                        )

                    Spacer()

                    Rectangle()
                        .fill(.blue)
                        .frame(
                            width: proxy.size.width,
                            height: proxy.safeAreaInsets.bottom
                        )
                }

                HStack {
                    Rectangle()
                        .fill(.blue)
                        .frame(
                            width: proxy.safeAreaInsets.leading,
                            height: proxy.size.height
                        )

                    Spacer()

                    Rectangle()
                        .fill(.blue)
                        .frame(
                            width: proxy.safeAreaInsets.leading,
                            height: proxy.size.height
                        )
                }

                VStack {
                    HStack {
                        Rectangle()
                            .fill(.red)
                            .frame(
                                width: proxy.containerCornerInsets.topLeading.width,
                                height: proxy.containerCornerInsets.topLeading.height
                            )
                            .padding(.top, proxy.safeAreaInsets.top)
                            .padding(.leading, proxy.safeAreaInsets.leading)

                        Spacer()
                    }

                    Spacer()
                }
            }
            .ignoresSafeArea()
        }

        VStack {
            HStack {
                Text("とても大切な文字列")
                    .font(.largeTitle)

                Spacer()
            }

            Spacer()
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
