load("@aspect_rules_ts//ts:defs.bzl", "ts_config")
load("@npm//:defs.bzl", "npm_link_all_packages")
load("@aspect_rules_js//npm:defs.bzl", "npm_link_package")

npm_link_all_packages(name = "node_modules")

npm_link_package(
    name = "node_modules/@sound/foo",
    src = "//foo",
)

ts_config(
    name = "tsconfig",
    src = "tsconfig.json",
    visibility = ["//visibility:public"],
)

ts_config(
    name = "tsconfig-node",
    src = "tsconfig.node.json",
    visibility = ["//visibility:public"],
)

ts_config(
    name = "tsconfig-test",
    src = "tsconfig-test.json",
    visibility = ["//visibility:public"],
    deps = ["//:tsconfig"],
)
