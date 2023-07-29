// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DB",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "DB",
            targets: ["DB"]),
    ],
    dependencies: [
        .package(url: "https://github.com/arturdev/Unrealm.git", .upToNextMinor(from: "1.9.5"))
    ],
    targets: [
        .target(
            name: "DB",
            dependencies: ["Unrealm"]),
        .testTarget(
            name: "DBTests",
            dependencies: ["DB"]),
    ]
)
