# Whatfix Mobile SDK for iOS

The Whatfix Mobile SDK adds Whatfix in-app guidance to your iOS app: walkthroughs, tooltips, beacons, popups, Self Help and Task Lists, managed from the Whatfix dashboard without app releases.

- iOS 15.0 or later
- Distributed as a precompiled XCFramework (device and simulator)
- Swift Package Manager and CocoaPods

## Installation

The latest version is listed under [Releases](https://github.com/whatfix/WhatfixMobileSDK/releases). Replace `<version>` below with it.

### Swift Package Manager
In Xcode, choose **File > Add Package Dependencies…** and enter:

```
https://github.com/whatfix/WhatfixMobileSDK.git
```

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/whatfix/WhatfixMobileSDK.git", from: "<version>")
]
```

### CocoaPods
Add to your `Podfile`, then run `pod install`:

```ruby
pod 'WhatfixMobileSDK', '~> <version>'
```

## Getting started

Start the SDK once, as early as possible, for example in `application(_:didFinishLaunchingWithOptions:)`:

```swift
import WhatfixMobileSDK

WhatfixMobile.shared.start(entId: "<your-enterprise-id>")
```

Identify the user and add properties as they become known:

```swift
WhatfixMobile.shared.setUserId(userId)
WhatfixMobile.shared.setAppLocale("en_US")
WhatfixMobile.shared.addTextProperty("plan", "enterprise")
```

Clear the user on sign-out:

```swift
WhatfixMobile.shared.logout()
```

Your enterprise ID is available from your Whatfix account team.

## Support

Contact your Whatfix account team, or visit [whatfix.com](https://whatfix.com).

## License

See [LICENSE](LICENSE).
