import SwiftUI

struct DetailView: View {
    var yukumo: Yukumo

    var body: some View {
        Image(yukumo.resource)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
}

#Preview {
    DetailView(yukumo: .higara)
}
