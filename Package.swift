// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "Adster",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Adster",
            type: .static,
            targets: ["Adster"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdsxGrowth/ios-sdk.git",
            exact: "1.6.0"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "AdsFramework",
            path: "Frameworks/AdsFramework.xcframework"
        ),
        .target(
            name: "Adster",
            dependencies: [
                "AdsFramework",
                .product(name: "XGrowthAdsSdk", package: "ios-sdk")
            ],
            path: "Sources",
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AppTrackingTransparency"),
                .linkedFramework("WebKit")
            ]
        ),
    ]
)

