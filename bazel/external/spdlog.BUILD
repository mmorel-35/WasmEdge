# SPDX-License-Identifier: Apache-2.0
# Build file for spdlog library

cc_library(
    name = "spdlog",
    srcs = glob([
        "src/*.cpp",
    ]),
    hdrs = glob([
        "include/spdlog/**/*.h",
    ]),
    defines = [
        "SPDLOG_COMPILED_LIB",
    ],
    includes = ["include"],
    visibility = ["//visibility:public"],
    deps = ["@fmt"],
)
