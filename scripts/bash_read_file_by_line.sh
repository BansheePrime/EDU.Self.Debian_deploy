#!/usr/bin/env bash
file="./scripts/bash_line_by_line_test.sh"
while IFS= read -r line
do
    # display $line or do somthing with $line
    printf '%s\n' "$line"
done <"$file"
