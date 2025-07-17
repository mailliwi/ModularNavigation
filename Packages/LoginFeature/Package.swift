// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoginFeature",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "LoginFeature",
            targets: ["LoginFeature"]
        ),
    ],
    dependencies: [
        .package(name: "MyBase", path: "../MyBase"),
        .package(name: "MyInfrastructure", path: "../MyInfrastructure")
    ],
    targets: [
        .target(
            name: "LoginFeature",
            dependencies: [
                "MyBase",
                "MyInfrastructure"
            ]
        ),
    ]
)
