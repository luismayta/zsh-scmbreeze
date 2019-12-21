#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install scmbreeze for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#


PATH_SCM_BREEZE=$HOME/.scm_breeze

df_command_exists() (
    if alias "$1" >/dev/null 2>&1; then
        unalias "$1" >/dev/null 2>&1
    fi

    command -v "$1" >/dev/null 2>&1
)

function scmbreeze::install {
    if ! type -p git > /dev/null; then
        message_info "not found git, please install git"
    fi
    message_info "Installing SCMBREEZE"
    git clone git://github.com/ndbroadbent/scm_breeze.git "${PATH_SCM_BREEZE}"
    "${PATH_SCM_BREEZE}/install.sh"
    zstyle ':notify:*' success-title "Finished install dependences"
}

function scmbreeze::install::async {
    if df_command_exists async_start_worker; then
        async_init
        # Start a worker that will report job completion
        async_start_worker scmbreeze_worker_install -n
        # Register our callback function to run when the job completes
        async_register_callback scmbreeze_worker_install scmbreeze::completed::callback
        # Start the job
        async_job scmbreeze_worker_install scmbreeze::install
    fi
}

function scmbreeze::install::factory {
    if df_command_exists async_start_worker; then
        scm_breeze::install::async
    else
        scmbreeze::install
    fi
}

# Define a function to process the result of the job
function scmbreeze::completed::callback {
    async_job scmbreeze_worker_install scmbreeze::install
}

function scmbreeze::init {
    # Add SCMBREEZE to PATH for scripting
    # shellcheck source=/dev/null
    [ -s "${HOME}/.scm_breeze/scm_breeze.sh" ] && source "${HOME}/.scm_breeze/scm_breeze.sh"
}

scmbreeze::init

if [ ! -e "${PATH_SCM_BREEZE}" ]; then
    scmbreeze::install::factory
fi
