// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealFacebookAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealFacebookAdapter",
            targets: ["AppodealFacebookAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/facebook/facebook-ios-sdk", exact: "18.0.3"),
    ],
    targets: [
        .target(
            name: "AppodealFacebookAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "FacebookCore", package: "facebook-ios-sdk"),
                .target(name: "AppodealFacebookAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealFacebookAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealFacebookAdapter/18.0.3.0/AppodealFacebookAdapter.xcframework.zip",
            checksum: "4bd08622ff38c4635023d3486786389e0b2e87836132631b243b298c6e2be55f"
        ),

    ]
)
