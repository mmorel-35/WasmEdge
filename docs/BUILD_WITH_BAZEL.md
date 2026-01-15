# Building WasmEdge with Bazel

This document describes how to build WasmEdge using Bazel.

## Prerequisites

- [Bazel](https://bazel.build/) 6.5.0 or later (recommended to use [Bazelisk](https://github.com/bazelbuild/bazelisk))
- C++ compiler with C++20 support (GCC 11+, Clang 12+, or MSVC 2019+)

## Quick Start

### Install Bazelisk (Recommended)

Bazelisk automatically downloads and uses the correct Bazel version specified in `.bazelversion`:

```bash
# On Linux
wget -O /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-amd64
chmod +x /usr/local/bin/bazel

# On macOS
brew install bazelisk

# On Windows
choco install bazelisk
```

### Build the WasmEdge library

```bash
# Build the shared library
bazel build //lib/api:libwasmedge

# Build the static library
bazel build //lib/api:api
```

### Build the WasmEdge CLI tools

```bash
# Build the wasmedge runtime
bazel build //tools/wasmedge:wasmedge

# Build the wasmedge compiler
bazel build //tools/wasmedge:wasmedgec

# Build all tools
bazel build //tools/wasmedge/...
```

### Build everything

```bash
bazel build //...
```

## Build Configurations

### Release Build (Optimized)

```bash
bazel build --config=release //...
```

### Debug Build

```bash
bazel build --config=debug //...
```

## Running Tests

```bash
# Run all tests
bazel test //...

# Run specific test
bazel test //test/common:common_test
```

## Using WasmEdge in Your Bazel Project

To use WasmEdge in your own Bazel project, add the following to your `WORKSPACE` file:

```python
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Add WasmEdge
http_archive(
    name = "wasmedge",
    # Update with the desired version
    sha256 = "...",
    strip_prefix = "WasmEdge-<version>",
    urls = ["https://github.com/WasmEdge/WasmEdge/archive/refs/tags/<version>.tar.gz"],
)

load("@wasmedge//bazel:repositories.bzl", "wasmedge_repositories")
wasmedge_repositories()

load("@wasmedge//bazel:dependencies.bzl", "wasmedge_dependencies")
wasmedge_dependencies()
```

Then in your `BUILD.bazel` file:

```python
cc_binary(
    name = "my_app",
    srcs = ["main.cpp"],
    deps = ["@wasmedge//lib/api"],
)
```

## Project Structure

The Bazel build is organized as follows:

- `/WORKSPACE` - Main workspace configuration
- `/BUILD.bazel` - Root build file
- `/bazel/` - Bazel configuration files
  - `repositories.bzl` - External dependency definitions
  - `dependencies.bzl` - Dependency setup
  - `external/` - BUILD files for external dependencies
- `/lib/*/BUILD.bazel` - Library component build files
- `/tools/*/BUILD.bazel` - Tool build files
- `.bazelrc` - Bazel configuration options
- `.bazelversion` - Specifies the Bazel version to use

## Advanced Usage

### Cross-compilation

Bazel supports cross-compilation. For example, to build for ARM64:

```bash
bazel build --platforms=@platforms//os:linux --cpu=aarch64 //...
```

### Custom Build Flags

You can pass custom C++ flags:

```bash
bazel build --cxxopt=-DMY_CUSTOM_FLAG //...
```

### Verbose Build Output

```bash
bazel build --verbose_failures --subcommands //...
```

## Troubleshooting

### Clean Build

If you encounter issues, try cleaning the build:

```bash
bazel clean
# or for a complete clean
bazel clean --expunge
```

### Check Bazel Version

```bash
bazel version
```

### View Build Dependencies

```bash
bazel query 'deps(//lib/api)' --output graph
```

## Comparison with CMake Build

The Bazel build provides several advantages:

- **Hermetic builds**: All dependencies are tracked and versioned
- **Incremental builds**: Only changed components are rebuilt
- **Caching**: Build artifacts can be cached locally or remotely
- **Parallelism**: Highly parallel build execution
- **Cross-platform**: Consistent builds across different operating systems

The CMake build system is still the primary build system. The Bazel build is provided as an alternative for projects that prefer or require Bazel.

## Contributing

If you encounter issues with the Bazel build or have suggestions for improvements, please:

1. Check existing [issues](https://github.com/WasmEdge/WasmEdge/issues)
2. File a new issue with the `bazel` label
3. Submit a pull request with improvements

## Resources

- [Bazel Documentation](https://bazel.build/docs)
- [Bazel C++ Tutorial](https://bazel.build/tutorials/cpp)
- [WasmEdge Documentation](https://wasmedge.org/docs/)
