#!/bin/sh

CE10_BASE=ftp://hgdownload.cse.ucsc.edu/goldenPath/ce10/bigZips
F=chromFa.tar.gz

get() {
	file=$1
	if ! wget --version >/dev/null 2>/dev/null ; then
		if ! curl --version >/dev/null 2>/dev/null ; then
			echo "Please install wget or curl somewhere in your PATH"
			exit 1
		fi
		curl -o `basename $1` $1
		return $?
	else
		wget -O `basename $1` $1
		return $?
	fi
}

HISAT2_BUILD_EXE=./hisat2-build
if [ ! -x "$HISAT2_BUILD_EXE" ] ; then
	if ! which hisat2-build ; then
		echo "Could not find hisat2-build in current directory or in PATH"
		exit 1
	else
		HISAT2_BUILD_EXE=`which hisat2-build`
	fi
fi

rm -f genome.fa
get ${CE10_BASE}/$F || (echo "Error getting $F" && exit 1)
tar xvzfO $F > genome.fa || (echo "Error unzipping $F" && exit 1)
rm $F

CMD="${HISAT2_BUILD_EXE} genome.fa genome"
echo "Running $CMD"
if $CMD ; then
	echo "genome index built; you may remove fasta files"
else
	echo "Index building failed; see error message"
fi

