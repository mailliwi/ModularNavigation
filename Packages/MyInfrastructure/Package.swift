// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyInfrastructure",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "MyInfrastructure",
            targets: ["MyInfrastructure"]
        ),
    ],
    dependencies: [
        .package(name: "MyBase", path: "../MyBase")
    ],
    targets: [
        .target(
            name: "MyInfrastructure",
            dependencies: ["MyBase"]
        ),
    ]
)
