#!/bin/bash
set -eoi pipefail
readonly COMMIT=`git log --pretty=format:'%h' -n 1`
readonly PKG=material-clase-$COMMIT.tar
git archive --format=tar HEAD -o $PKG .
gzip -9 $PKG

