import SwiftUI
import UIKit

public struct GalleryView: View {
    public init() {}

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.openWindow) var openWindow

    @State var yukumos: [Yukumo] = Yukumo.allCases

    private func itemWidth(windowWidth: CGFloat) -> CGFloat {
        guard windowWidth > 0 else { return 1 }

        let numberOfColumns: CGFloat = horizontalSizeClass == .compact ? 2 : 3
        return floor(
            windowWidth / numberOfColumns
        )
    }


    public var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                GalleryCollectionView(
                    items: $yukumos,
                    layout: CollectionViewLayout(
                        itemSize: CGSize(
                            width: itemWidth(windowWidth: proxy.size.width),
                            height: itemWidth(windowWidth: proxy.size.width)
                        ),
                        minimumInteritemSpacing: 0,
                        contentInsets: .zero
                    )
                ) { yukumo in
                    NavigationLink {
                        DetailView(yukumo: yukumo)
                    } label: {
                        Image(yukumo.resource)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .onDrag {
                                let userActivity = NSUserActivity(
                                    activityType: "dev.shoryu.MultiWindowExample.openWindow"
                                )
                                userActivity.targetContentIdentifier = "targetContentIdentifier"
                                return NSItemProvider(object: userActivity)
                            }
                    }
                    .contextMenu {
                        Button {
                            openWindow(value: yukumo)
                        } label: {
                            Text("新しいウィンドウで開く")
                        }
                    }
                }
            }
        }
    }
}

public struct GalleryCollectionView<Content: View, Item: Sendable & Hashable>: UIViewRepresentable {
    enum Section: Hashable {
        case main
    }

    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>

    @Binding var items: [Item]
    var layout: CollectionViewLayout
    @ViewBuilder var content: (Item) -> Content

    public init(
        items: Binding<[Item]>,
        layout: CollectionViewLayout = .default,
        content: @escaping (Item) -> Content
    ) {
        _items = items
        self.layout = layout
        self.content = content
    }

    public final class Coordinator: NSObject {
        var dataSource: DataSource!
    }

    public func makeCoordinator() -> Coordinator { Coordinator() }

    public func makeUIView(context: Context) -> UICollectionView {
        let collectionView = UICollectionView(
            frame: .null,
            collectionViewLayout: layout.flowLayout
        )

        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, Item> { cell, _, item in
            cell.contentConfiguration = UIHostingConfiguration {
                content(item)
            }
        }

        let dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: item
            )
        }

        context.coordinator.dataSource = dataSource

        return collectionView
    }

    public func updateUIView(_ uiView: UICollectionView, context: Context) {
        uiView.setCollectionViewLayout(layout.flowLayout, animated: true)

        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(items)
        context.coordinator.dataSource.apply(snapshot)
    }
}

@MainActor
public struct CollectionViewLayout: Sendable {
    var itemSize: CGSize
    var scrollDirection: UICollectionView.ScrollDirection
    var minimumInteritemSpacing: CGFloat
    var minimumLineSpacing: CGFloat
    var contentInsets: UIEdgeInsets

    public init(
        itemSize: CGSize,
        scrollDirection: UICollectionView.ScrollDirection = .vertical,
        minimumInteritemSpacing: CGFloat = 8,
        minimumLineSpacing: CGFloat = 8,
        contentInsets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    ) {
        self.itemSize = itemSize
        self.scrollDirection = scrollDirection
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.contentInsets = contentInsets
    }

    var flowLayout: UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = itemSize
        flowLayout.scrollDirection = scrollDirection
        flowLayout.minimumInteritemSpacing = minimumInteritemSpacing
        flowLayout.minimumLineSpacing = minimumLineSpacing
        flowLayout.sectionInset = contentInsets
        return flowLayout
    }

    public static let `default` = CollectionViewLayout(itemSize: CGSize(width: 50, height: 50))
}

#Preview {
    GalleryView()
}
