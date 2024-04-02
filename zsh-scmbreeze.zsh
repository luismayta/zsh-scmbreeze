#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install scmbreeze for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

# shellcheck disable=SC2034  # Unused variables left for readability
ZSH_SCMBREEZE_PATH=$(dirname "${0}")

# shellcheck source=/dev/null
source "${ZSH_SCMBREEZE_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_SCMBREEZE_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_SCMBREEZE_PATH}"/pkg/main.zsh