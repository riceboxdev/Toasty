// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Toasty",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Toasty",
            targets: ["Toasty"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Toasty",
            dependencies: []),
    ]
)

