// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2019-2024 Second State INC

#include <wasmedge/wasmedge.h>
#include <iostream>

int main() {
    // Get WasmEdge version
    std::cout << "WasmEdge Version: " 
              << WasmEdge_VersionGet()
              << std::endl;
    
    std::cout << "WasmEdge Bazel integration example" << std::endl;
    std::cout << "Successfully linked with WasmEdge library!" << std::endl;
    
    return 0;
}
