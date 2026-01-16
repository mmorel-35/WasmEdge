# Building WasmEdge with Bazel

## Quick Start

```bash
# Build everything
bazel build //...

# Build the library
bazel build //lib/api

# Build tools
bazel build //tools/wasmedge:wasmedge
bazel build //tools/wasmedge:wasmedgec
```

## Build Configurations

```bash
# Optimized build
bazel build --config=release //...

# Debug build
bazel build --config=debug //...
```

## Using WasmEdge in Your Bazel Project

Add to your `WORKSPACE` file:

```python
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "wasmedge",
    sha256 = "...",
    strip_prefix = "WasmEdge-<version>",
    urls = ["https://github.com/WasmEdge/WasmEdge/archive/refs/tags/<version>.tar.gz"],
)

load("@wasmedge//bazel:repositories.bzl", "wasmedge_repositories")
wasmedge_repositories()

load("@wasmedge//bazel:dependencies.bzl", "wasmedge_dependencies")
wasmedge_dependencies()
```

Add to your `BUILD.bazel` file:

```python
cc_binary(
    name = "my_app",
    srcs = ["main.cpp"],
    deps = ["@wasmedge//lib/api"],
)
```

## Resources

- [Bazel Documentation](https://bazel.build/docs)
- [WasmEdge Documentation](https://wasmedge.org/docs/)
