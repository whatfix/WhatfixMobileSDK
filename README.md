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

```swift
import WhatfixMobileSDK

// 1. At launch: start the SDK once.
WhatfixMobile.shared.start(entId: "<your-enterprise-id>")

// 2. After sign-in: identify the user and set their properties.
WhatfixMobile.shared.setUserId("user-8421")
WhatfixMobile.shared.setAppLocale("en_US")
WhatfixMobile.shared.addTextProperty("plan", "enterprise")
WhatfixMobile.shared.flush()   // required: sends the properties to Whatfix

// 3. On sign-out: clear the user.
WhatfixMobile.shared.logout()
```

Your enterprise ID is available from your Whatfix account team. Call every other method after `start`;
calls made before it are ignored.

## Start the SDK

Call `start(entId:creatorModeEnabled:region:)` once, as early as possible: in
`application(_:didFinishLaunchingWithOptions:)`, or in your SwiftUI `App`'s `init()`. Only the first
call in a launch takes effect, so the mode and region are fixed until the app is relaunched.

| Use | Call |
|---|---|
| End users (play mode), default region | `start(entId: "<id>")` |
| End users (play mode), EU region | `start(entId: "<id>", region: .eu)` |
| Content authors (creator mode), default region | `start(entId: "<id>", creatorModeEnabled: true)` |
| Content authors (creator mode), EU region | `start(entId: "<id>", creatorModeEnabled: true, region: .eu)` |

- **Play mode** (`creatorModeEnabled: false`, the default) shows your published Whatfix content to your
  users. This is the mode for App Store builds.
- **Creator mode** (`creatorModeEnabled: true`) adds a floating Whatfix button. Your content authors use
  it to pair the app with the Whatfix dashboard, capture its screens to build content, and preview
  content before publishing. Use it only in internal or TestFlight builds.
- **Region:** if your Whatfix account is hosted in the EU, pass `region: .eu` in every build, in both
  modes. It sends all of the SDK's traffic to Whatfix's EU hosts (`eu.whatfix.com`, `eucdn.whatfix.com`,
  `leap-api-eu.whatfix.com`). Without it, traffic goes to the default region.

**UIKit**

```swift
import UIKit
import WhatfixMobileSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        WhatfixMobile.shared.start(entId: "<your-enterprise-id>", region: .eu)
        return true
    }
}
```

**SwiftUI**

```swift
import SwiftUI
import WhatfixMobileSDK

@main
struct YourApp: App {
    init() {
        WhatfixMobile.shared.start(entId: "<your-enterprise-id>", region: .eu)
    }

    var body: some Scene {
        WindowGroup { ContentView() }
    }
}
```

**Creator mode in internal builds only.** Add `WHATFIX_CREATOR` to **Build Settings > Swift Compiler -
Custom Flags > Active Compilation Conditions** for your internal configuration, and leave it out of the
App Store configuration:

```swift
#if WHATFIX_CREATOR
let creatorMode = true
#else
let creatorMode = false
#endif

WhatfixMobile.shared.start(entId: "<your-enterprise-id>", creatorModeEnabled: creatorMode, region: .eu)
```

**Objective-C** (all three arguments are required):

```objc
@import WhatfixMobileSDK;

[WhatfixMobile.shared startWithEntId:@"<your-enterprise-id>" creatorModeEnabled:NO region:WFRegionEu];
// Default region: region:WFRegionUnspecified
```

## Custom properties

Custom properties describe the user (plan, role, signup date, …) for targeting content and for
analytics. Add them, then **call `flush()`**: properties are only stored on the device until you do, and
Whatfix doesn't evaluate them, so content targeted on them won't show.

```swift
WhatfixMobile.shared
    .addTextProperty("plan", "enterprise")?
    .addNumberProperty("seats", 250)?
    .addDateProperty("renewal_date", renewalDate, format: .DDMMYYYY)

WhatfixMobile.shared.flush()
```

- Call `flush()` after every batch of changes, e.g. after sign-in and whenever a property changes.
- Use the same property names as in your Whatfix dashboard's targeting rules. For dates, pick the
  `WFDateFormat` that matches the format chosen in the dashboard.
- Setting a key again replaces its value. Properties persist across launches until `logout()`.
- `setUserId` and `setAppLocale` don't need `flush()`; they apply immediately.

## API reference

All methods are on the shared instance, `WhatfixMobile.shared`, and can be called from any thread. They
return immediately and run in order in the background.

| Member | Description |
|---|---|
| `shared` | The single SDK instance. `WhatfixMobile()` isn't available; always use `shared`. |
| `start(entId:creatorModeEnabled:region:)` | Starts the SDK. `entId`: your enterprise ID. `creatorModeEnabled`: `true` for creator mode, default `false` (play mode). `region`: `.eu` for EU-hosted accounts, default `.unspecified`. Only the first call in a launch takes effect. See [Start the SDK](#start-the-sdk). |
| `setUserId(_:)` | Identifies the signed-in user, for targeting and analytics. Use a stable internal ID rather than an email address. Until it's called, the SDK uses an anonymous ID it generates. |
| `setAppLocale(_:)` | Sets the locale for localized content, as an ISO code such as `"en_US"` or `"de_DE"`. |
| `addTextProperty(_:_:)` | Stores a text property. Ignored if the key or value is empty or whitespace. Call `flush()` to send it. |
| `addNumberProperty(_:_:)` | Stores a number property (`Int`, `Double`, `NSNumber`). Ignored if the key is empty. Call `flush()` to send it. |
| `addDateProperty(_:_:format:)` | Stores a date property, sent in the given `WFDateFormat`. Ignored if the key is empty. Call `flush()` to send it. |
| `flush()` | Sends all stored custom properties to Whatfix. **Required** for custom properties to be evaluated. |
| `logout()` | Clears the user ID, locale and custom properties, and starts a new anonymous identity. Call it on sign-out. |
| `disable()` | Reserved for a future release; it has no effect yet. |

The three `add…Property` methods return `WhatfixMobile.shared`, so calls can be chained.

### `WFRegion`

| Case | Objective-C | Hosts |
|---|---|---|
| `.unspecified` (default) | `WFRegionUnspecified` | Whatfix's default region |
| `.eu` | `WFRegionEu` | Whatfix's EU region |

### `WFDateFormat`

How `addDateProperty` sends the date. The example is 12 October 2026; month names are always in English.

| Case | Objective-C | Example |
|---|---|---|
| `.DDMMYYYY` | `WFDateFormatDDMMYYYY` | `12/10/2026` |
| `.MMDDYYYY` | `WFDateFormatMMDDYYYY` | `10/12/2026` |
| `.YYYYMMDD` | `WFDateFormatYYYYMMDD` | `2026/10/12` |
| `.YYYYDDMM` | `WFDateFormatYYYYDDMM` | `2026/12/10` |
| `.DDMonthYYYY` | `WFDateFormatDDMonthYYYY` | `12 October 2026` |
| `.MonthDDYYYY` | `WFDateFormatMonthDDYYYY` | `October 12 2026` |

## Support

Contact your Whatfix account team, or visit [whatfix.com](https://whatfix.com).

## License

See [LICENSE](LICENSE).
