import PackageDescription

let package = Package(
    name: "swiftPM",
    dependencies: [
        .Package(url: "https://github.com/Alamofire/Alamofire.git", majorVersion: 4)
        ]
)
