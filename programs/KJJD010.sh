#!/bin/bash
set -xEeuo pipefail

#SELLが置かれている位置
SCRIPTDIR=$(cd $(dirname $0); pwd)
#ITF・OTFの場所
BINDIR="${SCRIPTDIR}"
#COPYLIBの場所
COPYLIBDIR="${SCRIPTDIR}/../copylib"
#COBOLプログラムの場所
PROGRAM="${SCRIPTDIR}"


# コンパイル
SRCFILE="${PROGRAM}/KJBM010/KJBM010.COB"
BINFILE=$(basename -s .COB $SRCFILE)
BINFILE="${BINFILE}.exe"

cobc -x -o "${BINDIR}/${BINFILE}" -I"${COPYLIBDIR}" "${SRCFILE}"

export ITF="${SCRIPTDIR}/data/KJJD010I.txt"
export OTF="${SCRIPTDIR}/data/KJBM010O.dat"

${BINDIR}/${BINFILE} | iconv -f cp932


# コンパイル
SRCFILE="${PROGRAM}/KJBM020/KJBM020.COB"
BINFILE=$(basename -s .COB $SRCFILE)
BINFILE="${BINFILE}.exe"

cobc -x -o "${BINDIR}/${BINFILE}" -I"${COPYLIBDIR}" "${SRCFILE}" "${PROGRAM}/KCBS010/KCBS010.cob"

export ITF="${SCRIPTDIR}/data/KJBM010O.dat"
export OTF="${SCRIPTDIR}/data/KJBM020O.dat"

${BINDIR}/${BINFILE} | iconv -f cp932


CTRLFILE=$(mktemp)
trap "rm -f $CTRLFILE" EXIT

cat <<_EOF_ >> $CTRLFILE
SORT FIELDS=(14, 5, ZD, A)
    USE  ${SCRIPTDIR}/data/KJBM020O.dat RECORD F,100 ORG SQ
    GIVE ${SCRIPTDIR}/data/SORT1O.dat   RECORD F,100 ORG SQ
_EOF_

gcsort TAKE $CTRLFILE


# コンパイル
SRCFILE="${PROGRAM}/KJBM030/KJBM030.COB"
BINFILE=$(basename -s .COB $SRCFILE)
BINFILE="${BINFILE}.exe"

cobc -x -o "${BINDIR}/${BINFILE}" -I"${COPYLIBDIR}" "${SRCFILE}"

export ITF="${SCRIPTDIR}/data/SORT1O.dat"
export IMF="${SCRIPTDIR}/data/KCCFSHO.dat"
export OTF="${SCRIPTDIR}/data/KJBM030O.dat"

${BINDIR}/${BINFILE} | iconv -f cp932


# コンパイル
SRCFILE="${PROGRAM}/KJBM050/KJBM050.COB"
BINFILE=$(basename -s .COB $SRCFILE)
BINFILE="${BINFILE}.exe"

cobc -x -o "${BINDIR}/${BINFILE}" -I"${COPYLIBDIR}" "${SRCFILE}"

export ITF="${SCRIPTDIR}/data/KJBM030O.dat"
export OTF1="${SCRIPTDIR}/data/KJBM050O1.dat"
export OTF2="${SCRIPTDIR}/data/KJBM050O2.dat"

${BINDIR}/${BINFILE} | iconv -f cp932


# コンパイル
SRCFILE="${PROGRAM}/KUBM010/KUBM010.COB"
BINFILE=$(basename -s .COB $SRCFILE)
BINFILE="${BINFILE}.exe"

cobc -x -o "${BINDIR}/${BINFILE}" -I"${COPYLIBDIR}" "${SRCFILE}"

export ITF="${SCRIPTDIR}/data/KJBM050O1.dat"
export OTF="${SCRIPTDIR}/data/KUBM010O.dat"

${BINDIR}/${BINFILE} | iconv -f cp932


CTRLFILE=$(mktemp)
trap "rm -f $CTRLFILE" EXIT

cat <<_EOF_ >> $CTRLFILE
SORT FIELDS=(14, 5, ZD, A, 2, 6, ZD, A)
    USE  ${SCRIPTDIR}/data/KUBM010O.dat RECORD F,100 ORG SQ
    GIVE ${SCRIPTDIR}/data/SORT2O.dat   RECORD F,100 ORG SQ
_EOF_

gcsort TAKE $CTRLFILE


# コンパイル
SRCFILE="${PROGRAM}/KUBM020/KUBM020.COB"
BINFILE=$(basename -s .COB $SRCFILE)
BINFILE="${BINFILE}.exe"

cobc -x -o "${BINDIR}/${BINFILE}" -I"${COPYLIBDIR}" "${SRCFILE}"

export ITF="${SCRIPTDIR}/data/SORT2O.dat"
export OTF="${SCRIPTDIR}/data/KUBM020O.dat"

${BINDIR}/${BINFILE} | iconv -f cp932