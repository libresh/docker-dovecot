#!/bin/bash -eux

sed -i "s/##DB_PASS##/${DB_ENV_MYSQL_PASSWORD}/" /etc/dovecot/dovecot-sql.conf.ext

/opt/editconf.py /etc/dovecot/conf.d/15-lda.conf postmaster_address=postmaster@${HOSTNAME}

/opt/mysql-check.sh

mkdir -p /mail/mailboxes
chown mail:mail /mail/mailboxes

mkdir -p /mail/sieve
mkdir -p /mail/sieve/global_before
mkdir -p /mail/sieve/global_after
chown -R mail:mail /mail/sieve

dovecot -F

