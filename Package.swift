// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

// sdk-version:2.16.0
import PackageDescription

let package = Package(
    name: "KakaoOpenSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "KakaoSDK",
            targets: ["KakaoSDKCommon", "KakaoSDKAuth", "KakaoSDKUser", "KakaoSDKTalk", "KakaoSDKFriend", "KakaoSDKFriendCore", "KakaoSDKStory", "KakaoSDKShare", "KakaoSDKNavi", "KakaoSDKTemplate"]),
        .library(
            name: "KakaoSDKCommon",
            targets: ["KakaoSDKCommon"]),        
        .library(
            name: "KakaoSDKAuth",
            targets: ["KakaoSDKAuth"]),
        .library(
            name: "KakaoSDKUser",
            targets: ["KakaoSDKUser"]),
        .library(
            name: "KakaoSDKTalk",
            targets: ["KakaoSDKTalk"]),
        .library(
            name: "KakaoSDKFriend",
            targets: ["KakaoSDKFriend"]),
        .library(
            name: "KakaoSDKFriendCore",
            targets: ["KakaoSDKFriendCore"]),
        .library(
            name: "KakaoSDKStory",
            targets: ["KakaoSDKStory"]),
        .library(
            name: "KakaoSDKShare",
            targets: ["KakaoSDKShare"]),
        .library(
            name: "KakaoSDKNavi",
            targets: ["KakaoSDKNavi"]),
        .library(
            name: "KakaoSDKTemplate",
            targets: ["KakaoSDKTemplate"])
    ],
    dependencies: [
        .package(name: "Alamofire",
                  url: "https://github.com/Alamofire/Alamofire.git",
                  Version(5,1,0)..<Version(5,4,5))
    ],
    targets: [
        .target(
            name: "KakaoSDKCommon",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
            ],
            exclude: ["Info.plist", "README.md"]
        ),
        .target(
            name: "KakaoSDKAuth",
            dependencies: [
                .target(name: "KakaoSDKCommon")
            ],
            exclude: ["Info.plist", "README.md"]
        ),
        .target(
            name: "KakaoSDKUser",
            dependencies: [
                .target(name: "KakaoSDKAuth")
            ],
            exclude: ["Info.plist", "README.md"]
        ),
        .target(
            name: "KakaoSDKTalk",
            dependencies: [
                .target(name: "KakaoSDKUser"),
                .target(name: "KakaoSDKTemplate")
            ],
            exclude: ["Info.plist", "README.md"]
        ),
        .target(
            name: "KakaoSDKFriend",
            dependencies: [
                .target(name: "KakaoSDKUser"),
                .target(name: "KakaoSDKFriendCore")
            ],
            exclude: ["Info.plist", "README.md"]
        ),
        .binaryTarget(
            name: "KakaoSDKFriendCore",
            path: "Sources/KakaoSDKFriendCore/KakaoSDKFriendCore.xcframework"
        ),
        .target(
            name: "KakaoSDKStory",
            dependencies: [
                .target(name: "KakaoSDKUser")
            ],
            exclude: ["Info.plist", "README.md"]
        ),
        .target(
            name: "KakaoSDKShare",
            dependencies: [
                .target(name: "KakaoSDKCommon"),
                .target(name: "KakaoSDKTemplate")
            ],
            exclude: ["Info.plist", "README.md"]
        ),
        .target(
            name: "KakaoSDKNavi",
            dependencies: [
                .target(name: "KakaoSDKCommon")
            ],
            exclude: ["Info.plist", "README.md"]
        ),
        .target(
            name: "KakaoSDKTemplate",
            dependencies: [
                .target(name: "KakaoSDKCommon")
            ],
            exclude: ["Info.plist", "README.md"]
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
