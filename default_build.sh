#!/bin/sh -x

export CONF_FLAGS=--no-install
if [ `opam list -i mirage-xen -s 2>/dev/null` ]; then
	make xen-build
else
  if [ `opam list -i mirage-kfreebsd -s 2>/dev/null` ]; then
	gmake kfreebsd-build
  else
    if [ `opam list -i mirage-net-direct -s 2>/dev/null` ]; then
	make unix-direct-build
    else
	make unix-socket-build
    fi
  fi
fi
