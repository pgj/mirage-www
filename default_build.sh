#!/bin/sh -x

type gmake > /dev/null 2>/dev/null
if [ "$?" -eq 0 ]; then
	MAKE=gmake
else
	MAKE=make
fi

export CONF_FLAGS=--no-install
if [ `opam list -i mirage-xen -s 2>/dev/null` ]; then
	$MAKE xen-build
else
  if [ `opam list -i mirage-kfreebsd -s 2>/dev/null` ]; then
	$MAKE kfreebsd-build
  else
    if [ `opam list -i mirage-net-direct -s 2>/dev/null` ]; then
	$MAKE unix-direct-build
    else
	$MAKE unix-socket-build
    fi
  fi
fi
