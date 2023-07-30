// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Network",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Network",
            targets: ["Network"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMinor(from: "5.7.0")),
        .package(url: "https://github.com/WeTransfer/Mocker.git", .upToNextMinor(from: "2.6.0"))
    ],
    targets: [
        .target(
            name: "Network",
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "NetworkTests",
            dependencies: ["Network", "Mocker"],
            resources: [.process("Mocks/response.json")]),
    ]
)
