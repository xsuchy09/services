#!/bin/bash

set -e

[ -f /var/lib/samba/.setup ] || {
    >&2 echo "[ERROR] Samba is not setup yet, which should happen automatically. Look for errors!"
    exit 127
}

chown root:root /var/lib/samba/private/tls/*

chmod 0600 /var/lib/samba/private/tls/key.pem

samba -i -s /var/lib/samba/private/smb.conf