# Royal Swift

<!-- Header Logo -->

<!--
<div align="center">
   <img width="600px" src="./Sources/RoyalSwift/RoyalSwift.docc/Resources/Images/banner-logo.png" alt="Banner Logo">
</div>

 -->


<!-- Badges -->

<p>

<!--  [![Swift Version Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Faking618%2FRoyalSwift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/aking618/RoyalSwift)-->
<!---->
<!--  [![Swift Platform Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Faking618%2FRoyalSwift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/aking618/RoyalSwift)-->

</p>


<p>
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" />
    <img src="https://github.com/aking618/RoyalSwift/workflows/Build%20&%20Test/badge.svg" />
    <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" />
    </a>
    <a href="mailto:ayrenking.dev@gmail.com">
        <img src="https://img.shields.io/badge/Contact-Ayren_King-lightgrey.svg?style=flat" alt="Email: ayrenking.dev@gmail.com" />
    </a>
</p>


<p align="center">

Royal Swift is a utility package that includes any classes, structs, enum, or extension that I have written and found useful!

</p>


## Installation

### Xcode Projects

Select `File` -> `Swift Packages` -> `Add Package Dependency` and enter `https://github.com/aking618/RoyalSwift`.

### Swift Package Manager Projects

You can add `RoyalSwift` as a package dependency in your `Package.swift` file:

```swift
let package = Package(
    //...
    dependencies: [
        .package(
            url: "https://github.com/aking618/RoyalSwift",
            exact: "0.0.1"
        ),
    ],
    //...
)
```

From there, refer to `RoyalSwift` as a "target dependency" in any of _your_ package's targets that need it.

```swift
targets: [
    .target(
        name: "YourLibrary",
        dependencies: [
          "RoyalSwift",
        ],
        ...
    ),
    ...
]
```

## Usage

## 🗺 Roadmap

- World Domination

## 💻 Developing

### Requirements

- Xcode 15.0+

### ✍️ Building The Documentation

Documentation is built with [DocC](https://developer.apple.com/documentation/docc) (see [Apple's guidance for more details about creating DocC content](https://developer.apple.com/documentation/docc/api-reference-syntax)).

To build and preview the documentation output, follow the instructions for the [here](https://github.com/apple/swift-docc-plugin#previewing-documentation) for the `Swift-DocC Plugin`.

If you're using VSCode, there's also a [task configuration](./.vscode/tasks.json) that will handle this directly from the editor 💪

## 🏷 License

`RoyalSwift` is available under the MIT license. See the [LICENSE file](./LICENSE.md) for more info.
