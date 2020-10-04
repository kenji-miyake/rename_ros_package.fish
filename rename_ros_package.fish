#!/usr/bin/env fish

set script_dir (realpath (dirname (status --current-filename)))

function to_pascal_case
    set -l snake_case $argv[1]
    echo "$snake_case" | sed -E 's/^(.)/\U\1/g' | sed -E 's/_(.)/\U\1/g'
end

function exec_rename
    set -l old_name $argv[1]
    set -l new_name $argv[2]

    sd "$old_name" "$new_name" (fd -t f)
    rename -s "$old_name" "$new_name" (fd -t d)
    rename -s "$old_name" "$new_name" (fd -t f)
end

set -l old_package_name (cat package.xml | grep "<name>" | sed -E 's/\s*<\/?name>//g')
set -l new_package_name (basename $script_dir)

exec_rename $old_package_name $new_package_name
exec_rename (to_pascal_case $old_package_name) (to_pascal_case $new_package_name)
