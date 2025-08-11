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
                "FBAudienceNetwork"
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

