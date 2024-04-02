#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function scmbreeze::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_SCMBREEZE_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_SCMBREEZE_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_SCMBREEZE_PATH}"/config/linux.zsh
      ;;
    esac
}

scmbreeze::config::main::factory
