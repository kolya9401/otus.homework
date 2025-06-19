// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocalStorage",
    platforms: [.iOS("18.0")],
    products: [
        .library(
            name: "LocalStorage",
            targets: ["LocalStorage"]
        ),
    ],
    dependencies: [
        // Ветка мастер, для того что бы проект собирался на Xcode26
        .package(url: "https://github.com/realm/realm-swift.git", branch: "master"),
    ],
    targets: [
        .target(
            name: "LocalStorage",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-swift")
            ]
        )
    ]
)
