// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "visionOSPackage",
    platforms: [
        .visionOS("26.0"),
    ],
    products: [
        .library(
            name: "visionOSPackage",
            targets: [
                "OpenWindow",
                "ChangeWindowSize",
                "AuthenticationWithPush",
            ]
        ),
    ],
    targets: [
        .target(name: "OpenWindow"),
        .target(name: "ChangeWindowSize"),
        .target(name: "AuthenticationWithPush"),
    ]
)
