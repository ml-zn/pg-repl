#!/bin/sh

function init() {
  mkdir -p {db1/{etc,pgdata},db2/{etc,pgdata}}
  docker run -i --rm postgres cat /usr/share/postgresql/postgresql.conf.sample > db1/etc/postgresql.conf
  cp db1/etc/* db2/etc/
  # sed -ie "s/^#port.*/port = 5435/g" db1/etc/postgresql.conf
}

function cleanup() {
  rm -rf db1 db2
}

"$@"
