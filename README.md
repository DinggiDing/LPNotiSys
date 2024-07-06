# Custom Local Push Notification System

[![Swift Version](https://img.shields.io/badge/Swift-5.10-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](https://developer.apple.com/ios/)

Custom Local Push Notification System is a Swift package that provides awesome functionality for your Swift projects.

![Simulator Screenshot - iPhone 15 Pro - 2024-07-06 at 18 47 15](https://github.com/DinggiDing/LPNotiSys/assets/77246590/15081209-7f1b-43f0-b2ba-5477c7b5a4ad)
![Simulator Screenshot - iPhone 15 Pro - 2024-07-06 at 18 47 22](https://github.com/DinggiDing/LPNotiSys/assets/77246590/15e313d1-8301-490a-b4b9-d9e79895bd6d)

## Features

- [x] **Feature 1**: Push notifications for different personalities. (Content-based recommendation system)
- [x] **Feature 2**: What time to spend (Default or User setting)
  - **User setting**:
    - Users get tired of push notifications based solely on random number generation.
    - Use a hash function (using CryptoKit), a date, and a random number generator to create randomness but not periodicity.



## Requirements

- iOS 17.0+ 
- Xcode 15.4+
- Swift 5.10+


### Swift Package Manager

To integrate "Custom Local Push Notification System" into your Xcode project using Swift Package Manager, add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/MyAwesomePackage.git", from: "1.0.0")
]
