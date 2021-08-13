// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "GoogleTagManager",
  platforms: [.iOS(.v11)],
  products: [
    .library(
      name: "GoogleTagManager",
      targets: ["GoogleTagManagerTarget"]
    ),
  ],
  dependencies: [
    .package(
      name: "Firebase",
      url: "https://github.com/firebase/firebase-ios-sdk.git",
      "8.0.0" ..< "9.0.0"
    ),
  ],
  targets: [
    .target(
      name: "GoogleTagManagerTarget",
      dependencies: [
        // "GoogleTagManager",
        "GoogleAnalytics",
        .product(name: "FirebaseAnalytics", package: "Firebase"),
      ],
      path: "GoogleTagManagerWrapper",
      linkerSettings: [
        .linkedLibrary("sqlite3"),
        .linkedLibrary("z"),
        .linkedFramework("AdSupport"),
        .linkedFramework("CoreData"),
        .linkedFramework("CoreTelephony"),
        .linkedFramework("JavaScriptCore"),
        .linkedFramework("SystemConfiguration"),
        .linkedFramework("UIKit"),
      ]
    ),
    .binaryTarget(
      name: "GoogleTagManager",
      url: "https://tsunghung.github.io/GoogleTagManager.zip",
      checksum: "7671114d12f3000bcaa6691693bb55765ce534462807aab0a5ea4e46ab7608ea"
    ),
    .binaryTarget(
      name: "GoogleAnalytics",
      url: "https://tsunghung.github.io/GoogleAnalytics.zip",
      checksum: "255e44905b5168a214995f74889eb8245778789c9fe915031099c6b6a481f21a"
    ),
  ],
  cLanguageStandard: .c99,
  cxxLanguageStandard: CXXLanguageStandard.gnucxx14
)
