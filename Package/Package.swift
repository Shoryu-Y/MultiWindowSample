// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Package",
    platforms: [.visionOS("2")],
    products: [
        .library(
            name: "Package",
            targets: [
                "OpenWindow",
                "ChangeWindowSize",
                "AuthenticationWithPush",
            ]
        ),
    ],
    targets: [
        .target(
            name: "OpenWindow",
            path: "Sources/1_OpenWindow"
        ),
        .target(
            name: "ChangeWindowSize",
            path: "Sources/2_ChangeWindowSize"
        ),
        .target(
            name: "AuthenticationWithPush",
            path: "Sources/3_AuthenticationWithPush"
        )
    ]
)
