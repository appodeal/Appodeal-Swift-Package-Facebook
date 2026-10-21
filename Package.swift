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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealFacebookAdapter/18.0.3.1/8998d62f3783/AppodealFacebookAdapter.xcframework.zip",
            checksum: "8998d62f3783d71a5b8675d88e10861723f42b6e31b9d6edb75e8d22121995dd"
        ),

    ]
)
