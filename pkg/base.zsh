#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function scmbreeze::install {
    scmbreeze::internal::install
}

function scmbreeze::load {
    scmbreeze::internal::load
}

function scmbreeze::post_install {
    message_info "Post Install ${SCMBREEZE_PACKAGE_NAME}"
    message_success "Success Install ${SCMBREEZE_PACKAGE_NAME}"
}