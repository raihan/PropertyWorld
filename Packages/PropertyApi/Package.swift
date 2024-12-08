// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PropertyApi",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "PropertyApi",
            targets: ["PropertyApi"]),
    ],
    dependencies: [
        .package(path: "../ApiService"),
        .package(path: "../Models")
    ],
    targets: [
        .target(
            name: "PropertyApi", dependencies: ["ApiService", "Models"]),
        .testTarget(
            name: "PropertyApiTests",
            dependencies: ["PropertyApi"]
        ),
    ]
)
