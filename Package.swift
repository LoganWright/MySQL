import PackageDescription

let package = Package(
    name: "MySQL",
    dependencies: [
        .Package(url: "https://github.com/loganwright/CMySQL.git", majorVersion: 1)
    ],
    targets: [
        Target(
            name: "UnitTests",
            dependencies: [.Target(name: "MySQL")]),
        Target(
            name: "MySQL")
    ]
)