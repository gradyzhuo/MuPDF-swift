# MuPDF-Swift 

> Currently under development, please do not use in a production environment.

## Getting the library

### Swift Package Manager

The Swift Package Manager is the preferred way to get KurrentDB. Simply add the package dependency to your Package.swift:

```swift
dependencies: [
  .package(url: "https://github.com/gradyzhuo/MuPDF-swift.git", branch: "main")
]
```
...and depend on "KurrentDB" in the necessary targets:

```swift
.target(
  name: ...,
  dependencies: [.product(name: "MuPDF", package: "MuPDF-swift")]
]
```
