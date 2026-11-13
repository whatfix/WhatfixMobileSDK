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
            url: "https://github.com/whatfix/WhatfixMobileSDK/releases/download/1.1.1/WhatfixMobileSDK.xcframework.zip",
            checksum: "33a8546c73b57b5c917374236ae1fd67f383278067ebff9a7336f40cccb8f43a"
        )
    ]
)