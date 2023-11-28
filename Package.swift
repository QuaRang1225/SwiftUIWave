// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIWave",
    platforms:  [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftUIWave",
            targets: ["SwiftUIWave"]),
    ],
    targets: [
        .target(
            name: "SwiftUIWave",
            dependencies: []),
    ]
)
