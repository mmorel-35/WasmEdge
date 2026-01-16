# WasmEdge Bazel Workspace

This document provides technical details about the Bazel workspace implementation.

## Overview

WasmEdge now supports Bazel builds alongside CMake. The implementation follows patterns from [proxy-wasm-cpp-host](https://github.com/proxy-wasm/proxy-wasm-cpp-host).

## File Structure

- `WORKSPACE` - Main workspace file
- `.bazelrc` - Build configuration
- `.bazelversion` - Specifies Bazel 6.5.0
- `BUILD.bazel` - Root build file
- `bazel/repositories.bzl` - External dependencies
- `bazel/dependencies.bzl` - Dependency setup
- `lib/*/BUILD.bazel` - Library component builds
- `tools/*/BUILD.bazel` - Tool builds

## Key Features

- **Hermetic builds**: All dependencies are explicit and versioned
- **Platform support**: Linux, macOS, Windows via `select()` statements
- **External dependencies**: fmt, spdlog, simdjson via `http_archive`
- **CI validation**: GitHub Actions workflow for automated testing

## Build Targets

```bash
# Library
bazel build //lib/api

# Tools
bazel build //tools/wasmedge:wasmedge
bazel build //tools/wasmedge:wasmedgec

# Everything
bazel build //...
```

## Not Included

The following are not yet part of the Bazel build and can be added incrementally:
- LLVM AOT compilation
- WASI NN RPC server
- Fuzzing targets
- Test infrastructure

## References

- [Bazel Documentation](https://bazel.build/docs)
- [proxy-wasm-cpp-host](https://github.com/proxy-wasm/proxy-wasm-cpp-host)
