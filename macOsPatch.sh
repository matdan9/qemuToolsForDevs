#!/bin/bash
codesign -s - --entitlements appE.xml --force /usr/local/bin/qemu-system-x86_64
