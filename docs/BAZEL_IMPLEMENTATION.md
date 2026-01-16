# WasmEdge Bazel Workspace

This document provides technical details about the Bazel workspace implementation.

## Overview

WasmEdge now supports Bazel builds alongside CMake. The implementation follows patterns from [proxy-wasm-cpp-host](https://github.com/proxy-wasm/proxy-wasm-cpp-host).

## File Structure

- `WORKSPACE` - Main workspace file
- `.bazelrc` - Build configuration with AOT support
- `.bazelversion` - Specifies Bazel 6.5.0
- `BUILD.bazel` - Root build file
- `bazel/repositories.bzl` - External dependencies including LLVM
- `bazel/dependencies.bzl` - Dependency setup
- `lib/*/BUILD.bazel` - Library component builds
- `tools/*/BUILD.bazel` - Tool builds

## Key Features

- **Hermetic builds**: All dependencies are explicit and versioned
- **Platform support**: Linux, macOS, Windows via `select()` statements
- **External dependencies**: fmt, spdlog, simdjson via `http_archive`
- **LLVM support**: Optional AOT compilation with LLVM toolchain
- **CI validation**: GitHub Actions workflow for automated testing

## Build Targets

```bash
# Library (without AOT)
bazel build //lib/api

# Library (with AOT)
bazel build --config=aot //lib/api

# Tools
bazel build //tools/wasmedge:wasmedge
bazel build //tools/wasmedge:wasmedgec

# Everything
bazel build //...

# Everything with AOT
bazel build --config=aot //...
```

## AOT Compilation with LLVM

AOT (Ahead-of-Time) compilation is disabled by default. To enable it, use the `--config=aot` flag:

```bash
bazel build --config=aot //...
```

This configuration:
- Downloads and builds LLVM 18.1.8 (large dependency)
- Enables `lib/llvm` and `lib/aot` libraries
- Adds AOT compilation defines

**Note**: LLVM is a large dependency. For production use, consider using system LLVM or pre-built binaries.

## Configuration Options

The `.bazelrc` file defines several build configurations:

- `--config=release` - Optimized build (-O3, NDEBUG)
- `--config=debug` - Debug build with symbols
- `--config=aot` - Enable AOT compilation with LLVM

## Not Included

The following are not yet part of the Bazel build and can be added incrementally:
- WASI NN RPC server
- Fuzzing targets
- Test infrastructure
- Plugin examples beyond built-in wasi_logging

## References

- [Bazel Documentation](https://bazel.build/docs)
- [proxy-wasm-cpp-host](https://github.com/proxy-wasm/proxy-wasm-cpp-host)
- [LLVM Project](https://llvm.org/)
