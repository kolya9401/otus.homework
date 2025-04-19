// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProPlayersFavorites",
    platforms: [.iOS("18.0")],
    products: [
        .library(
            name: "ProPlayersFavorites",
            targets: ["ProPlayersFavorites"]
        ),
    ],
    dependencies: [
        .package(path: "../OpenAPIClient"),
        .package(path: "../UIComponents"),
    ],
    targets: [
        .target(
            name: "ProPlayersFavorites",
            dependencies: [
                "OpenAPIClient",
                "UIComponents",
            ]
        )
    ]
)
