#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function scmbreeze::pkg::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_SCMBREEZE_PATH}"/pkg/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_SCMBREEZE_PATH}"/pkg/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_SCMBREEZE_PATH}"/pkg/linux.zsh
      ;;
    esac

}

scmbreeze::pkg::main::factory
