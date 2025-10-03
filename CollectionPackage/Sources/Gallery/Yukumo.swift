import SwiftUI

enum Yukumo: String, CaseIterable, Hashable, Codable {
    case first
    case wide
    case backlit
    case library
    case tennis
    case sightseeing
    case higara
    case tatsubee
    case recent

    var resource: ImageResource {
        switch self {
        case .first: ._20230610
        case .wide: ._20230718
        case .backlit: ._20240113
        case .library: ._20240213
        case .tennis: ._20240316
        case .sightseeing: ._20240428
        case .higara: ._20250924Higara
        case .tatsubee: .tatsubee
        case .recent: .recent
        }
    }

    var uiImage: UIImage { UIImage(resource: resource) }

    var title: String {
        switch self {
        case .first: "初めて書いたユクモちゃん"
        case .wide: "ステッカー用に書いたユクモちゃん"
        case .backlit: "逆光なユクモちゃん"
        case .library: "角川サクラタウンの図書館に感動しているユクモちゃん"
        case .tennis: "テニスをしているユクモちゃん"
        case .sightseeing: "観光するユクモちゃん"
        case .higara: "他の人に書いてもらったユクモちゃん"
        case .tatsubee: "たつべえ"
        case .recent: "最近書いている途中のユクモちゃん"
        }
    }
}
