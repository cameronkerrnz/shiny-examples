#!/bin/sh

# The container will run with a high-numbered ethemeral UID, but
# will have group set to root.
#
# This, in this file, everything will be run by a non-privileged
# user, so run stuff here, but avoid setup tasks that would require
# root privileges.

exec shiny-server >> /var/log/shiny-server.log 2>&1
