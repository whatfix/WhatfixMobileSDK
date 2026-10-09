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
            url: "https://github.com/whatfix/WhatfixMobileSDK/releases/download/1.0.0/WhatfixMobileSDK.xcframework.zip",
            checksum: "4c7b9198eecffb3ba92a58b88fc06aba308d79e29b8544a356162601b906671a"
        )
    ]
)