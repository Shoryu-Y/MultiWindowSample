// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "iPadOSPackage",
    platforms: [.iOS("26.0")],
    products: [
        .library(
            name: "iPadOSPackage",
            targets: [
                "WindowControls",
            ]
        ),
    ],
    targets: [
        .target(name: "WindowControls"),
    ]
)
