# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: 2019-2026 Second State INC

# BUILD file for LLVM
# This is a simplified build configuration for LLVM components needed by WasmEdge AOT compilation.
# For production use, consider using a pre-built LLVM or the official LLVM Bazel build.

package(default_visibility = ["//visibility:public"])

# Note: This is a placeholder BUILD file.
# Building LLVM from source with Bazel is complex and requires significant resources.
# For production use, it's recommended to:
# 1. Use system-installed LLVM libraries
# 2. Use pre-built LLVM binaries
# 3. Use the official LLVM Bazel repository: https://github.com/llvm/llvm-project/tree/main/utils/bazel

# Minimal interface for LLVM support
cc_library(
    name = "llvm",
    hdrs = glob([
        "llvm/include/**/*.h",
        "llvm/include/**/*.def",
        "llvm/include/**/*.inc",
    ]),
    includes = [
        "llvm/include",
    ],
    visibility = ["//visibility:public"],
)

# LLD linker interface
cc_library(
    name = "lld",
    hdrs = glob([
        "lld/include/**/*.h",
    ]),
    includes = [
        "lld/include",
    ],
    visibility = ["//visibility:public"],
)
