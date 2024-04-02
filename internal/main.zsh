#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function scmbreeze::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_SCMBREEZE_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_SCMBREEZE_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_SCMBREEZE_PATH}"/internal/linux.zsh
      ;;
    esac
}

scmbreeze::internal::main::factory
scmbreeze::internal::load

if ! core::exists git; then core::install git; fi
if [ ! -e "${SCMBREEZE_ROOT}" ]; then
  scmbreeze::internal::install
fi