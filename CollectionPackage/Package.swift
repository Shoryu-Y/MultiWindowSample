// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "CollectionPackage",
    platforms: [
        .iOS("26.0"),
        .visionOS("26.0"),
    ],
    products: [
        .library(
            name: "CollectionPackage",
            targets: ["Gallery"]
        ),
    ],
    targets: [
        .target(name: "Gallery"),
    ]
)
