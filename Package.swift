// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "CellHider",
    products: [
        .library(
            name: "CellHider",
            targets: ["CellHider"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "CellHider",
            dependencies: [])
    ]
)
