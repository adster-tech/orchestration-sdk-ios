// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "Adster",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Adster",
            type: .static,
            targets: ["Adster"]
        ),
    ],
    dependencies: [
        // AdsFramework.xcframework is built against Google Mobile Ads SDK
        // 13.2.0. Declaring it here makes the GoogleMobileAds module available
        // to consumers of the Adster library.
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            .upToNextMajor(from: "13.2.0")
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
                .product(
                    name: "GoogleMobileAds",
                    package: "swift-package-manager-google-mobile-ads"
                )
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

