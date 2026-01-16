# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: 2019-2026 Second State INC

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

def wasmedge_dependencies():
    """Load all dependencies for WasmEdge."""
    
    bazel_skylib_workspace()
