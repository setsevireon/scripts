#!/usr/bin/env bash

source ../lib.bash

printf "Script dir: %s\n" "$(scriptdir)"
printf "Script path: %s\n" "$(scriptfile)"
printf "Script basename: %s\n" "$(scriptname)"

printf "Working dir: %s\n" "$(workingdir)"
echo "foo" >"$(workingdir)/foo.txt"
echo "=== foo ==="
cat "$(workingdir)/foo.txt"
echo "==========="
