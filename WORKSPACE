workspace(
    name = "tianxia-novi",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "aspect_rules_js",
    sha256 = "66ecc9f56300dd63fb86f11cfa1e8affcaa42d5300e2746dba08541916e913fd",
    strip_prefix = "rules_js-1.13.0",
    url = "https://github.com/aspect-build/rules_js/archive/refs/tags/v1.13.0.tar.gz",
)

load("@aspect_rules_js//js:repositories.bzl", "rules_js_dependencies")

rules_js_dependencies()

load("@aspect_rules_js//npm:npm_import.bzl", "npm_translate_lock")

npm_translate_lock(
    name = "npm",
    npmrc = "//:.npmrc",
    pnpm_lock = "//:pnpm-lock.yaml",
    verify_node_modules_ignored = "//:.bazelignore",
    lifecycle_hooks_no_sandbox = False,
)

load("@npm//:repositories.bzl", "npm_repositories")

npm_repositories()

http_archive(
    name = "aspect_rules_ts",
    sha256 = "e81f37c4fe014fc83229e619360d51bfd6cb8ac405a7e8018b4a362efa79d000",
    strip_prefix = "rules_ts-1.0.4",
    url = "https://github.com/aspect-build/rules_ts/archive/refs/tags/v1.0.4.tar.gz",
)

load("@aspect_rules_ts//ts:repositories.bzl", "rules_ts_dependencies")

rules_ts_dependencies(
    ts_version_from = "//:package.json",
)

http_archive(
    name = "aspect_rules_jasmine",
    patch_args = ["-p1"],
    patches = ["//:rules_jasmine.patch"],
    sha256 = "28bd02acbcd78dd4fbe0ee133b21b11977acd70329a83fc987ff8c0a6ffae9e2",
    strip_prefix = "rules_jasmine-0.2.3",
    url = "https://github.com/aspect-build/rules_jasmine/archive/refs/tags/v0.2.3.tar.gz",
)

load("@aspect_rules_jasmine//jasmine:dependencies.bzl", "rules_jasmine_dependencies")

rules_jasmine_dependencies()

load("@aspect_rules_jasmine//jasmine:repositories.bzl", "jasmine_repositories")

jasmine_repositories(name = "jasmine")

load("@jasmine//:npm_repositories.bzl", jasmine_npm_repositories = "npm_repositories")

jasmine_npm_repositories()

load("@rules_nodejs//nodejs:repositories.bzl", "DEFAULT_NODE_VERSION", "nodejs_register_toolchains")

nodejs_register_toolchains(
    name = "nodejs",
    node_version = DEFAULT_NODE_VERSION,
)

load("@rules_nodejs//nodejs:yarn_repositories.bzl", "yarn_repositories")

yarn_repositories(
    name = "yarn",
    node_repository = "nodejs",
)

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "ee3280a7f58aa5c1caa45cb9e08cbb8f4d74300848c508374daf37314d5390d6",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/5.5.1/rules_nodejs-5.5.1.tar.gz"],
)

load("@build_bazel_rules_nodejs//:repositories.bzl", "build_bazel_rules_nodejs_dependencies")

build_bazel_rules_nodejs_dependencies()

load("@build_bazel_rules_nodejs//:index.bzl", "yarn_install")

yarn_install(
    name = "build_bazel_rules_sass_deps",
    frozen_lockfile = False,
    package_json = "//tools/sass:package.json",
    symlink_node_modules = False,
    yarn_lock = "//tools/sass:yarn.lock",
)

http_archive(
    name = "io_bazel_rules_sass",
    patch_args = ["-p1"],
    patches = ["//:rule_sass.patch"],
    sha256 = "5313032124ff191eed68efcfbdc6ee9b5198093b2b80a8e640ea34feabbffc69",
    strip_prefix = "rules_sass-1.34.0",
    urls = [
        "https://github.com/bazelbuild/rules_sass/archive/1.34.0.zip",
        "https://mirror.bazel.build/github.com/bazelbuild/rules_sass/archive/1.34.0.zip",
    ],
)

load("@io_bazel_rules_sass//:package.bzl", "rules_sass_dependencies")

rules_sass_dependencies()

http_archive(
    name = "aspect_rules_esbuild",
    sha256 = "f9b5bf16251e3e4e127337ef968e6a398c9a4f353f1730e6c7ff6c9a8981e858",
    strip_prefix = "rules_esbuild-0.13.4",
    url = "https://github.com/aspect-build/rules_esbuild/archive/refs/tags/v0.13.4.tar.gz",
)

load("@aspect_rules_esbuild//esbuild:dependencies.bzl", "rules_esbuild_dependencies")

rules_esbuild_dependencies()

load("@aspect_rules_esbuild//esbuild:repositories.bzl", "esbuild_register_toolchains", LATEST_ESBUILD_VERSION = "LATEST_VERSION")

esbuild_register_toolchains(
    name = "esbuild",
    esbuild_version = LATEST_ESBUILD_VERSION,
)
