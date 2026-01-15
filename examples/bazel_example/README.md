# Example: Using WasmEdge in a Bazel Project

This example demonstrates how to use WasmEdge as a dependency in a Bazel project.

## Project Structure

```
bazel_example/
├── WORKSPACE
├── BUILD.bazel
├── main.cpp
└── README.md
```

## Building the Example

From this directory:

```bash
bazel build :example
```

## Running the Example

```bash
bazel run :example
```

## How It Works

The `WORKSPACE` file declares WasmEdge as an external dependency by referencing the parent WasmEdge workspace. In a real project, you would use an `http_archive` to fetch WasmEdge from GitHub.

The `BUILD.bazel` file defines a binary that depends on the WasmEdge API library.
