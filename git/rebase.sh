#!/bin/bash
set -e -x
Merge_from=$1
Merge_to=$2
f_merge_func(){
    cd "${WORKSPACE}" || { echo "[ERROR] failed to cd  ${WORKSPACE} !"; exit 1;}
    [ -d "${WORKSPACE}/.git/rebase-apply" ] && { rm -fr "${WORKSPACE}/.git/rebase-apply"; }
    git checkout -B "${Merge_from}"  "origin/${Merge_from}"
    git clean -df
    git reset --hard HEAD

    echo "=====rebase to ${Merge_to}====="
    git checkout -B "${Merge_to}" "origin/${Merge_to}"
    git clean -df
    git reset --hard HEAD

    git rebase "${Merge_from}"
    git push origin "${Merge_to}"
    echo "merge to master success"
}

f_merge_func
