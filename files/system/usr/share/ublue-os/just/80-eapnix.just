# Fix 1Password GIDs
[group('System')]
fix-onepassword-gids:
    #!/bin/bash
    # fixes 1Password GID problems on ublue-os custom images
    # originally from https://gist.github.com/b-/ed2cdc182ae5a92bdcd6b73308832a70
    set -euxo pipefail

    OPCLI_CONF=$(</usr/lib/sysusers.d/onepassword-cli.conf)
    TARGET_OPCLI_GID="${OPCLI_CONF##g onepassword-cli }"
    CURRENT_OPCLI_GID=$(getent group onepassword-cli | cut -d: -f3)
    OP_CONF=$(</usr/lib/sysusers.d/onepassword.conf)
    CURRENT_OP_GID=$(getent group onepassword | cut -d: -f3)
    TARGET_OP_GID="${OP_CONF##g onepassword }"

    if [ "${CURRENT_OP_GID}" -ne "${TARGET_OP_GID}" ] ; then
        sudo groupmod -g "${TARGET_OP_GID}" onepassword && echo "New onepassword GID: ${TARGET_OP_GID}"
    fi
    if [ "${CURRENT_OPCLI_GID}" -ne "${TARGET_OPCLI_GID}" ] ; then
        sudo groupmod -g "${TARGET_OPCLI_GID}" onepassword-cli && echo "New onepassword GID: ${TARGET_OP_GID}"
    fi
