#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
#set -o xtrace

# Load libraries
. /opt/bitnami/scripts/libspark.sh
. /opt/bitnami/scripts/libos.sh

# Load Spark environment variables
eval "$(spark_env)"
info "** Executing run.sh with spark mode: (""$SPARK_MODE"")**"

if [ "$SPARK_MODE" == "master" ]; then
    # Master constants
    info "** Starting Spark in master mode with: ""$(command -v start-master.sh)"")**"
    echo "** ""$(command -v start-master.sh)""**"
    EXEC=$(command -v start-master.sh)
    info "** Debug: I am past EXEC=**"
    ARGS=()
else
    # Worker constants
    info "** Starting Spark in worker mode (with $(command -v start-slave.sh))**"
    EXEC=$(command -v start-slave.sh)
    ARGS=("$SPARK_MASTER_URL")

fi
if am_i_root; then
    info "** Continuing as root **"
    exec gosu "$SPARK_DAEMON_USER" "$EXEC" "${ARGS[@]-}"
else
    info "** Continuing as non-root **"
    exec "$EXEC" "${ARGS[@]-}"
fi
