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
            targets: ["Adster"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", exact: "20.0.1")
    ],
    targets: [
        .binaryTarget(
            name: "AdsFramework",
            path: "Frameworks/AdsFramework.xcframework"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            path: "Frameworks/DTBiOSSDK.xcframework"
        ),
        .binaryTarget(
            name: "FBAudienceNetwork",
            path: "Frameworks/FBAudienceNetwork.xcframework"
        ),
        .target(
            name: "Adster",
            dependencies: [
                "AdsFramework",
                "DTBiOSSDK",
                "FBAudienceNetwork",
                .product(name: "RealmSwift", package: "realm-swift")
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

