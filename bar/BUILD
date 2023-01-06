load("//tools:ts_package.bzl", "ts_package")

ts_package(
    name = "bar",
    srcs = [
        "bar.ts",
        "jumbo.ts",
    ],
    test_srcs = [
        "bar.spec.ts",
        "bar_bis.spec.ts",
    ],
    deps = [
        "//:node_modules/@sound/foo",
    ],
)
