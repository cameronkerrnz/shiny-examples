#!/bin/sh
if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    # Rewrite the UID of the shiny user that the shiny package created
    # Running inside Openshift, we don't know which UID we will run as
    sed -re "s@^(shiny:x):[^:]*:(.*)@\1:$(id -u):\2@" /etc/passwd > /tmp/passwd
    cat /tmp/passwd > /etc/passwd
    rm -f /tmp/passwd
  fi
fi
exec "$@"
