#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: 2019-2026 Second State INC

import sys

def main():
    if len(sys.argv) != 3:
        print("Usage: generate_config.py <input> <output>")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    
    with open(input_file, "r") as f:
        content = f.read()
    
    # Replace the multi-line CMAKE_INSTALL_FULL_LOCALSTATEDIR block
    content = content.replace(
        '#cmakedefine CMAKE_INSTALL_FULL_LOCALSTATEDIR                                  \\\n    "@CMAKE_INSTALL_FULL_LOCALSTATEDIR@"',
        '#define CMAKE_INSTALL_FULL_LOCALSTATEDIR "/var/lib"')
    
    # Replace other cmakedefine directives
    content = content.replace("#cmakedefine HAVE_MMAP @HAVE_MMAP@", "#define HAVE_MMAP 1")
    content = content.replace("#cmakedefine HAVE_PWD_H @HAVE_PWD_H@", "#define HAVE_PWD_H 1")
    
    with open(output_file, "w") as f:
        f.write(content)

if __name__ == "__main__":
    main()
