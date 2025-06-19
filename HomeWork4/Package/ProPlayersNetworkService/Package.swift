// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProPlayersNetworkService",
    platforms: [.iOS("18.0")],
    products: [
        .library(
            name: "ProPlayersNetworkService",
            targets: ["ProPlayersNetworkService"]
        ),
    ],
    dependencies: [
        .package(path: "../OpenAPIClient"),
    ],
    targets: [
        .target(
            name: "ProPlayersNetworkService",
            dependencies: [
                "OpenAPIClient",
            ]
        )
    ]
)
