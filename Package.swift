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
            url: "https://github.com/whatfix/WhatfixMobileSDK/releases/download/0.0.1/WhatfixMobileSDK.xcframework.zip",
            checksum: "0c8375202bd271cfdb47fa839d3cf0e712cb264470cc4cfac32d05a333b07594"
        )
    ]
)