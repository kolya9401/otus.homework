// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProPlayersList",
    platforms: [.iOS("18.0")],
    products: [
        .library(
            name: "ProPlayersList",
            targets: ["ProPlayersList"]
        ),
    ],
    dependencies: [
        .package(path: "../ProPlayersNetworkService"),
        .package(path: "../LocalStorage"),
    ],
    targets: [
        .target(
            name: "ProPlayersList",
            dependencies: [
                "ProPlayersNetworkService",
                "LocalStorage",
            ]
        )
    ]
)
