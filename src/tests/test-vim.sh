#!/bin/bash -x
#
# pre: test -f tests/NOTE
# post: diff "$SPWD/tests/NOTE" "$HPWD/tests/NOTE" | grep -q NOTE
#

# launching vim
vim -u NONE -c ":q"

# delete one line and write
vim -u NONE -c ":delete" -c ":wq" tests/NOTE

# launch vi
vi  -u NONE -c ":wq" tests/NOTE
