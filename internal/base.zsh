#!/usr/bin/env ksh
# -*- coding: utf-8 -*-
function scmbreeze::internal::install {
    message_info "Installing SCMBREEZE"
    git clone https://github.com/scmbreeze/scm_breeze.git "${SCMBREEZE_ROOT}"
    "${SCMBREEZE_ROOT}/install.sh"
    message_success "Installed SCMBREEZE"
}

function scmbreeze::internal::load {
    # Add SCMBREEZE to PATH for scripting
    # shellcheck source=/dev/null
    [ -s "${SCMBREEZE_ROOT}/scm_breeze.sh" ] && source "${SCMBREEZE_ROOT}/scm_breeze.sh"
}