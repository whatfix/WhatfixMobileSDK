// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "WhatfixMobileSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "WhatfixMobileSDK",
            targets: ["WhatfixMobileSDK"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "WhatfixMobileSDK",
            url: "https://github.com/whatfix/WhatfixMobileSDK/releases/download/1.0.1/WhatfixMobileSDK.xcframework.zip",
            checksum: "6bfc88f5a9e8212831caadca86d6fef1c65647bd3055021ff72267777a2e1001"
        )
    ]
)