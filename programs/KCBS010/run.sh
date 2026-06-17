#!/bin/bash
set -Eeuo pipefail

SCRIPTDIR=$(cd $(dirname $0); pwd)

PROGRAMNAME="KJBM0202"
BINDIR="${SCRIPTDIR}"
PROGRAM="${BINDIR}/${PROGRAMNAME}"

export ITF="${SCRIPTDIR}/KCBS010I.dat"
export OTF="${SCRIPTDIR}/KCBS010O.dat"

${PROGRAM} | iconv -f cp932
