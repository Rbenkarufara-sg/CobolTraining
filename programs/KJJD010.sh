#!/bin/bash
set -xEeuo pipefail

#SELLが置かれている位置
SCRIPTDIR=$(cd $(dirname $0); pwd)

export ITF="${SCRIPTDIR}/data/KJJD010I.txt"
export OTF="${SCRIPTDIR}/data/KJBM010O.dat"

${SCRIPTDIR}/KJBM010/KJBM010 | iconv -f cp932

export COB_LIBRARY_PATH="${SCRIPTDIR}/KCBS010"
export ITF="${SCRIPTDIR}/data/KJBM010O.dat"
export OTF="${SCRIPTDIR}/data/KJBM020O.dat"

${SCRIPTDIR}/KJBM020/KJBM020 | iconv -f cp932

#商品番号の昇順に並び替える
CTRLFILE=$(mktemp)
trap "rm -f $CTRLFILE" EXIT

cat <<_EOF_ >> $CTRLFILE
SORT FIELDS=(14, 5, ZD, A)
    USE  ${SCRIPTDIR}/data/KJBM020O.dat RECORD F,100 ORG SQ
    GIVE ${SCRIPTDIR}/data/SORT1O.dat   RECORD F,100 ORG SQ
_EOF_

gcsort TAKE $CTRLFILE

export ITF="${SCRIPTDIR}/data/SORT1O.dat"
export IMF="${SCRIPTDIR}/data/KCCFSHO.dat"
export OTF="${SCRIPTDIR}/data/KJBM030O.dat"

${SCRIPTDIR}/KJBM030/KJBM030 | iconv -f cp932

export ITF="${SCRIPTDIR}/data/KJBM030O.dat"
export OTF1="${SCRIPTDIR}/data/KJBM050O1.dat"
export OTF2="${SCRIPTDIR}/data/KJBM050O2.dat"

${SCRIPTDIR}/KJBM050/KJBM050 | iconv -f cp932

export ITF="${SCRIPTDIR}/data/KJBM050O1.dat"
export OTF="${SCRIPTDIR}/data/KUBM010O.dat"

${SCRIPTDIR}/KUBM010/KUBM010 | iconv -f cp932

#商品番号の昇順、同一商品内は受注弁月の昇順に並び替える
CTRLFILE=$(mktemp)
trap "rm -f $CTRLFILE" EXIT

cat <<_EOF_ >> $CTRLFILE
SORT FIELDS=(14, 5, ZD, A, 2, 6, ZD, A)
    USE  ${SCRIPTDIR}/data/KUBM010O.dat RECORD F,100 ORG SQ
    GIVE ${SCRIPTDIR}/data/SORT2O.dat   RECORD F,100 ORG SQ
_EOF_

gcsort TAKE $CTRLFILE

export ITF="${SCRIPTDIR}/data/SORT2O.dat"
export OTF="${SCRIPTDIR}/data/KUBM020O.dat"

${SCRIPTDIR}/KUBM020/KUBM020 | iconv -f cp932