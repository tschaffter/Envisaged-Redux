#!/bin/bash

# Envisaged Redux
# Copyright (c) 2019 Carl Colena
#
# SPDX-License-Identifier: Apache-2.0

# Constants
ER_COLOR_ERROR='\e[31m'
ER_COLOR_WARN='\e[33m'
ER_COLOR_INFO='\e[96m'
ER_COLOR_OK='\e[92m'
ER_COLOR_NOTICE='\e[93m'
ER_NO_COLOR='\e[0m'
ER_ROOT_DIRECTORY="/visualization"

function log_error
{
    >&2 printf "${ER_COLOR_ERROR}[ERROR]${ER_NO_COLOR} ${1}\n"
}
function log_warn
{
    printf "${ER_COLOR_WARN}[WARN]${ER_NO_COLOR} ${1}\n"
}
function log_notice
{
    printf "${ER_COLOR_NOTICE}[NOTE]${ER_NO_COLOR} ${1}\n"
}
function log_info
{
    printf "${ER_COLOR_INFO}[INFO]${ER_NO_COLOR} ${1}\n"
}
function log_success
{
    printf "${ER_COLOR_OK}[OK]${ER_NO_COLOR} ${1}\n"
}

readonly -f log_error
readonly -f log_warn
readonly -f log_notice
readonly -f log_info
readonly -f log_success

# Set the common global flag
ER_COMMON_GLOBAL=1