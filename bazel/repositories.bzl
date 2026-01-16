# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: 2019-2024 Second State INC

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def wasmedge_repositories():
    """Load all repository dependencies for WasmEdge."""

    # Bazel Skylib
    maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = "bc283cdfcd526a52c3201279cda4bc298652efa898b10b4db0837dc51652756f",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz",
        ],
    )

    # Rules for C++
    maybe(
        http_archive,
        name = "rules_cc",
        sha256 = "2037875b9a4456dce4a79d112a8ae885bbc4aad968e6587dca6e64f3a0900cdf",
        strip_prefix = "rules_cc-0.0.9",
        urls = ["https://github.com/bazelbuild/rules_cc/releases/download/0.0.9/rules_cc-0.0.9.tar.gz"],
    )

    # fmt library
    maybe(
        http_archive,
        name = "fmt",
        build_file = "@wasmedge//bazel/external:fmt.BUILD",
        sha256 = "5dea48d1fcddc3ec571ce2058e13910a0d4a6bab4cc09a809d8b1dd1c88ae6f2",
        strip_prefix = "fmt-9.1.0",
        urls = ["https://github.com/fmtlib/fmt/archive/refs/tags/9.1.0.tar.gz"],
    )

    # spdlog library
    maybe(
        http_archive,
        name = "spdlog",
        build_file = "@wasmedge//bazel/external:spdlog.BUILD",
        sha256 = "5197b3147cfcfaa67dd564db7b878e4a4b3d9f3443801722b3915cdeced656cb",
        strip_prefix = "spdlog-1.12.0",
        urls = ["https://github.com/gabime/spdlog/archive/refs/tags/v1.12.0.tar.gz"],
    )

    # simdjson library
    maybe(
        http_archive,
        name = "simdjson",
        build_file = "@wasmedge//bazel/external:simdjson.BUILD",
        sha256 = "828450c0de03ee0e35c2ae0402b4ced75640cf0dc5a243e2a0414cba19c84c0f",
        strip_prefix = "simdjson-3.6.0",
        urls = ["https://github.com/simdjson/simdjson/archive/refs/tags/v3.6.0.tar.gz"],
    )

    # GoogleTest for testing
    maybe(
        http_archive,
        name = "com_google_googletest",
        sha256 = "7b42b4d6ed48810c5362c265a17faebe90dc2373c885e5216439d37927f02926",
        strip_prefix = "googletest-1.15.2",
        urls = ["https://github.com/google/googletest/archive/refs/tags/v1.15.2.tar.gz"],
    )

    # LLVM for AOT compilation (optional)
    # Note: This is a large download. Only needed if AOT compilation is enabled.
    maybe(
        http_archive,
        name = "llvm-raw",
        build_file = "@wasmedge//bazel/external:llvm.BUILD",
        sha256 = "a7b8c0c2f5ecbfaf3eb615d54f93c53ad9dbe776e5d55cd7b8d7e25b85e41fd7",
        strip_prefix = "llvm-project-llvmorg-18.1.8",
        urls = ["https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-18.1.8.tar.gz"],
    )
