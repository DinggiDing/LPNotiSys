# Custom Local Push Notification System

[![Build Status](https://github.com/yourusername/MyAwesomePackage/workflows/CI/badge.svg)](https://github.com/yourusername/MyAwesomePackage/actions)
[![Swift Version](https://img.shields.io/badge/Swift-5.10-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](https://developer.apple.com/ios/)

Custom Local Push Notification System is a Swift package that provides awesome functionality for your Swift projects.

## Features

- [x] Feature 1: Push notifications for different personalities. (Content-based recommendation system)
- [x] Feature 2: What time to spend (Default or User setting)
      - In User setting :
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
