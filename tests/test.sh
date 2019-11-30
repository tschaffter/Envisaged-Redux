#!/bin/bash

# Envisaged Redux
# Copyright (c) 2019 Carl Colena
#
# SPDX-License-Identifier: MIT

# Entry Point into testing.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. ${DIR}/common/test_common.bash
export SAVE=0
export COUNT=1
while [[ $# -gt 0 ]]; do
    k="$1"
    case $k in
        -s)
            SAVE=1
        ;;
    esac
    shift
done

# Set up git test repo
GIT_PARENT_DIR="/visualization/git_sandbox"
mkdir -p ${GIT_PARENT_DIR}
echo "Initializing Git Test Sandbox..."
${DIR}/git_testbed.sh ${GIT_PARENT_DIR} > /dev/null 2>&1


# Unit tests
echo "Starting Unit Tests"
bats ${DIR}/bats_tests/gource_arg_parse.bats

# Integration tests
echo "Starting Integration Tests"

# TODO Test log creation (revursive, multi, etc)

# Test Gource x ffmpeg args


# Set up environment
mkdir -p /visualization/video
ln -sf /visualization/git_sandbox/repo1 /visualization/git_repo

bats ${DIR}/bats_tests/integration_args.bats

[ "${SAVE}" = "1" ] && mv /visualization/cmd_test_data.txt /hostdir/cmd_test_data.txt

echo "Test Complete Success"