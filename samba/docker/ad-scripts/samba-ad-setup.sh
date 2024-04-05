#!/bin/bash

set -e

info () {
    echo "[INFO] $@"
}

info "Running setup"

# Check if samba is setup
[ -f /var/lib/samba/.setup ] && info "Already setup..." && exit 0

info "Provisioning domain controller..."

info "Given admin password: ${SMB_ADMIN_PASSWORD}"

rm -f /etc/samba/smb.conf

samba-tool domain provision\
 --server-role=${SMB_SERVER_ROLE}\
 --use-rfc2307\
 --dns-backend=SAMBA_INTERNAL\
 --realm=${SMB_REALM}\
 --host-name=${SMB_HOSTNAME}\
 --domain=${SMB_DOMAIN}\
 --adminpass=${SMB_ADMIN_PASSWORD}

mv /etc/samba/smb.conf /var/lib/samba/private/smb.conf

touch /var/lib/samba/.setup