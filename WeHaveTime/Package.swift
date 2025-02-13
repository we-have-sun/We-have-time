// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WeHaveTime",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "WeHaveTime",
            targets: ["WeHaveTime"]),
    ],
    targets: [
        .target(
            name: "WeHaveTime",
            path: "Sources/WeHaveTime",
            exclude: [],
            sources: ["Utils", "Views", "."]  // Explicitly include all directories
        ),
        .testTarget(
            name: "WeHaveTimeTests",
            dependencies: ["WeHaveTime"]),
    ]
)
