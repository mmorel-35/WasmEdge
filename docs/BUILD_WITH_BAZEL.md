# Building WasmEdge with Bazel

WasmEdge supports both traditional WORKSPACE-based and modern Bzlmod (MODULE.bazel) builds.

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

# With AOT compilation support (requires LLVM)
bazel build --config=aot //...
```

## AOT (Ahead-of-Time) Compilation

WasmEdge supports AOT compilation using LLVM. To enable it:

```bash
# Build with AOT support
bazel build --config=aot //...

# Build specific targets with AOT
bazel build --config=aot //lib/api
bazel build --config=aot //tools/wasmedge:wasmedge
```

**Note**: Building with AOT support requires downloading and building LLVM, which is a large dependency (>1GB download). The initial build may take significant time and resources.

For production use with AOT, consider:
- Using system-installed LLVM libraries
- Using pre-built LLVM binaries
- Configuring Bazel to use a local LLVM installation

## Using WasmEdge in Your Bazel Project

### With Bzlmod (MODULE.bazel) - Recommended

Add to your `MODULE.bazel` file:

```python
bazel_dep(name = "wasmedge", version = "0.14.0")
```

### With WORKSPACE (Legacy)

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

### Using in BUILD files

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
- [Bzlmod Guide](https://bazel.build/build/bzlmod)
- [WasmEdge Documentation](https://wasmedge.org/docs/)
