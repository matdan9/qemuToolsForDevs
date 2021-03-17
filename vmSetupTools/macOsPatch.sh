#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
codesign -s - --entitlements "("$parent_path")/appE.xml" --force /usr/local/bin/qemu-system-x86_64
