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
            url: "https://github.com/whatfix/WhatfixMobileSDK/releases/download/1.1.0/WhatfixMobileSDK.xcframework.zip",
            checksum: "cef9b7052474b1e25a95f7df01399dc6e7e54a932bcf9cc43c1e10b454ec8142"
        )
    ]
)