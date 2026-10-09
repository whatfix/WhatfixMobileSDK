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

### Camera permission

The SDK includes a QR code scanner that Whatfix content creators use to connect a build of your app to
the Whatfix dashboard. Because the SDK uses the camera, your app's `Info.plist` must include a camera
usage description, **even if you never enable creator mode**. Without it, App Store Connect warns
"ITMS-90683: Missing purpose string in Info.plist" when you upload, and App Review can reject the build.

Add this to your app's `Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>The camera is used to scan a Whatfix QR code that connects this app to Whatfix.</string>
```

- **The key must be in your app's `Info.plist`.** iOS and App Store Connect ignore permission texts in a
  framework's `Info.plist`, so the SDK can't declare it for you.
- **If your app already uses the camera,** keep your existing description; an app has only one. Make
  sure it still reads correctly for your users.
- **Without the key, the SDK doesn't crash:** creators enter a pairing code instead of scanning.

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
