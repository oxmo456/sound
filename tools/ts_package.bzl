load("@aspect_rules_ts//ts:defs.bzl", "ts_project")
load("@aspect_rules_js//npm:defs.bzl", "npm_package")
load("@aspect_rules_jasmine//jasmine:defs.bzl", "jasmine_test")

# buildifier: disable=function-docstring
def ts_package(name, srcs = [], deps = [], test_srcs = []):
    ts_project(
        name = "_{}_ts_project".format(name),
        srcs = srcs,
        deps = deps,
        declaration = True,
        declaration_map = True,
        source_map = True,
        tsconfig = "//:tsconfig",
        visibility = ["//visibility:public"],
    )

    npm_package(
        name = name,
        srcs = [
            "_{}_ts_project".format(name),
        ],
        include_runfiles = False,
        package = "@tianxia/{}".format(native.package_name()),
        visibility = ["//visibility:public"],
    )

    if test_srcs:
        ts_project(
            name = "_{}_ts_project_spec".format(name),
            testonly = True,
            srcs = test_srcs,
            declaration = False,
            tsconfig = "//:tsconfig-test",
            deps = [
                "_{}_ts_project".format(name),
                "//:node_modules/@types/jasmine",
                "//:node_modules/@types/node",
            ],
        )

        jasmine_test(
            name = "_{}_jasmine_test".format(name),
            args = [file.replace(".ts", ".js") for file in test_srcs],
            chdir = native.package_name(),
            data = [
                "_{}_ts_project".format(name),
                "_{}_ts_project_spec".format(name),
            ],
        )
