#!/usr/bin/env bash

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  READ THE ZPROJECT/README.MD FOR INFORMATION ABOUT MAKING PERMANENT CHANGES. #
################################################################################

REQUESTED_BRANCH=$1

set -e

if [ -z "$DEPENDENCIES_DIR" ]; then
    export DEPENDENCIES_DIR="`pwd`/tmp-deps"
fi
mkdir -p "$DEPENDENCIES_DIR"
cd "$DEPENDENCIES_DIR"

# Clone and build dependencies, if not yet installed to Travis env as DEBs
# or MacOS packages; other OSes are not currently supported by Travis cloud
echo "`date`: Starting build of dependencies (if any) using ci_dependencies.sh $REQUESTED_BRANCH..."

# Start of recipe for dependency: libsodium
if ! (command -v dpkg-query >/dev/null 2>&1 && dpkg-query --list libsodium-dev >/dev/null 2>&1) || \
       (command -v brew >/dev/null 2>&1 && brew ls --versions libsodium >/dev/null 2>&1) || \
       ([ -e "libsodium" ]) \
; then

    FOLDER_NAME="libsodium"

if [ -d "$FOLDER_NAME" ]; then
    echo "$FOLDER_NAME already exist. Skipped." >&2
else
    echo ""
    BASE_PWD=${PWD}
    echo "`date`: INFO: Building prerequisite 'libsodium' from Git repository..." >&2
    if [ "x$REQUESTED_BRANCH" = "x" ]; then
        echo "git clone https://github.com/42ity/libsodium.git $FOLDER_NAME"
        $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/libsodium.git $FOLDER_NAME
    else
        if git ls-remote --heads https://github.com/42ity/libsodium.git | grep -q "$REQUESTED_BRANCH"; then
            echo "git clone -b "$REQUESTED_BRANCH" https://github.com/42ity/libsodium.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 -b "$REQUESTED_BRANCH" https://github.com/42ity/libsodium.git $FOLDER_NAME
        else
            echo "$REQUESTED_BRANCH not found for https://github.com/42ity/libsodium.git"
            echo "git clone https://github.com/42ity/libsodium.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/libsodium.git $FOLDER_NAME
        fi
    fi
    echo "Entering in ${PWD}/${FOLDER_NAME}"
    cd "./${FOLDER_NAME}"
    CCACHE_BASEDIR=${PWD}
    export CCACHE_BASEDIR
        git --no-pager log --oneline -n1
    if [ -e ci_dependencies.sh ]; then
        PROPAGATED_BRANCH="`git branch | grep \* | cut -d ' ' -f2`"
        DEFAULT_BRANCH="`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`"
        if [ "x$REQUESTED_BRANCH" = "x" ]; then
            echo "`date`: INFO: Building prerequisites of 'libsodium' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        elif [ "x$PROPAGATED_BRANCH" = "x$DEFAULT_BRANCH" ]; then
            echo "`date`: INFO: Building prerequisites of 'libsodium' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        else
            echo "`date`: INFO: Building prerequisites of 'libsodium' using ci_dependencies.sh $PROPAGATED_BRANCH branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh $PROPAGATED_BRANCH)
        fi
    fi
    if [ -e autogen.sh ]; then
        $CI_TIME ./autogen.sh 2> /dev/null
    fi
    if [ -e buildconf ]; then
        $CI_TIME ./buildconf 2> /dev/null
    fi
    if [ ! -e autogen.sh ] && [ ! -e buildconf ] && [ ! -e ./configure ] && [ -s ./configure.ac ]; then
        $CI_TIME libtoolize --copy --force && \
        $CI_TIME aclocal -I . && \
        $CI_TIME autoheader && \
        $CI_TIME automake --add-missing --copy && \
        $CI_TIME autoconf || \
        $CI_TIME autoreconf -fiv
    fi
    $CI_TIME ./configure "${CONFIG_OPTS[@]}"
    $CI_TIME make -j4
    $CI_TIME make install
    echo "Leaving from ${PWD}"
    cd "${BASE_PWD}"
    echo "Now in ${PWD}"
fi
fi


# Start of recipe for dependency: libzmq
if ! (command -v dpkg-query >/dev/null 2>&1 && dpkg-query --list libzmq3-dev >/dev/null 2>&1) || \
       (command -v brew >/dev/null 2>&1 && brew ls --versions libzmq >/dev/null 2>&1) || \
       ([ -e "libzmq" ]) \
; then

    FOLDER_NAME="libzmq"

if [ -d "$FOLDER_NAME" ]; then
    echo "$FOLDER_NAME already exist. Skipped." >&2
else
    echo ""
    BASE_PWD=${PWD}
    echo "`date`: INFO: Building prerequisite 'libzmq' from Git repository..." >&2
    if [ "x$REQUESTED_BRANCH" = "x" ]; then
        echo "git clone https://github.com/42ity/libzmq.git $FOLDER_NAME"
        $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/libzmq.git $FOLDER_NAME
    else
        if git ls-remote --heads https://github.com/42ity/libzmq.git | grep -q "$REQUESTED_BRANCH"; then
            echo "git clone -b "$REQUESTED_BRANCH" https://github.com/42ity/libzmq.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 -b "$REQUESTED_BRANCH" https://github.com/42ity/libzmq.git $FOLDER_NAME
        else
            echo "$REQUESTED_BRANCH not found for https://github.com/42ity/libzmq.git"
            echo "git clone https://github.com/42ity/libzmq.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/libzmq.git $FOLDER_NAME
        fi
    fi
    echo "Entering in ${PWD}/${FOLDER_NAME}"
    cd "./${FOLDER_NAME}"
    CCACHE_BASEDIR=${PWD}
    export CCACHE_BASEDIR
        git --no-pager log --oneline -n1
    if [ -e ci_dependencies.sh ]; then
        PROPAGATED_BRANCH="`git branch | grep \* | cut -d ' ' -f2`"
        DEFAULT_BRANCH="`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`"
        if [ "x$REQUESTED_BRANCH" = "x" ]; then
            echo "`date`: INFO: Building prerequisites of 'libzmq' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        elif [ "x$PROPAGATED_BRANCH" = "x$DEFAULT_BRANCH" ]; then
            echo "`date`: INFO: Building prerequisites of 'libzmq' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        else
            echo "`date`: INFO: Building prerequisites of 'libzmq' using ci_dependencies.sh $PROPAGATED_BRANCH branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh $PROPAGATED_BRANCH)
        fi
    fi
    if [ -e autogen.sh ]; then
        $CI_TIME ./autogen.sh 2> /dev/null
    fi
    if [ -e buildconf ]; then
        $CI_TIME ./buildconf 2> /dev/null
    fi
    if [ ! -e autogen.sh ] && [ ! -e buildconf ] && [ ! -e ./configure ] && [ -s ./configure.ac ]; then
        $CI_TIME libtoolize --copy --force && \
        $CI_TIME aclocal -I . && \
        $CI_TIME autoheader && \
        $CI_TIME automake --add-missing --copy && \
        $CI_TIME autoconf || \
        $CI_TIME autoreconf -fiv
    fi
    $CI_TIME ./configure "${CONFIG_OPTS[@]}"
    $CI_TIME make -j4
    $CI_TIME make install
    echo "Leaving from ${PWD}"
    cd "${BASE_PWD}"
    echo "Now in ${PWD}"
fi
fi


# Start of recipe for dependency: czmq
if ! (command -v dpkg-query >/dev/null 2>&1 && dpkg-query --list libczmq-dev >/dev/null 2>&1) || \
       (command -v brew >/dev/null 2>&1 && brew ls --versions czmq >/dev/null 2>&1) || \
       ([ -e "czmq" ]) \
; then

    FOLDER_NAME="czmq"

if [ -d "$FOLDER_NAME" ]; then
    echo "$FOLDER_NAME already exist. Skipped." >&2
else
    echo ""
    BASE_PWD=${PWD}
    echo "`date`: INFO: Building prerequisite 'czmq' from Git repository..." >&2
    if [ "x$REQUESTED_BRANCH" = "x" ]; then
        echo "git clone https://github.com/42ity/czmq.git $FOLDER_NAME"
        $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/czmq.git $FOLDER_NAME
    else
        if git ls-remote --heads https://github.com/42ity/czmq.git | grep -q "$REQUESTED_BRANCH"; then
            echo "git clone -b "$REQUESTED_BRANCH" https://github.com/42ity/czmq.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 -b "$REQUESTED_BRANCH" https://github.com/42ity/czmq.git $FOLDER_NAME
        else
            echo "$REQUESTED_BRANCH not found for https://github.com/42ity/czmq.git"
            echo "git clone https://github.com/42ity/czmq.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/czmq.git $FOLDER_NAME
        fi
    fi
    echo "Entering in ${PWD}/${FOLDER_NAME}"
    cd "./${FOLDER_NAME}"
    CCACHE_BASEDIR=${PWD}
    export CCACHE_BASEDIR
        git --no-pager log --oneline -n1
    if [ -e ci_dependencies.sh ]; then
        PROPAGATED_BRANCH="`git branch | grep \* | cut -d ' ' -f2`"
        DEFAULT_BRANCH="`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`"
        if [ "x$REQUESTED_BRANCH" = "x" ]; then
            echo "`date`: INFO: Building prerequisites of 'czmq' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        elif [ "x$PROPAGATED_BRANCH" = "x$DEFAULT_BRANCH" ]; then
            echo "`date`: INFO: Building prerequisites of 'czmq' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        else
            echo "`date`: INFO: Building prerequisites of 'czmq' using ci_dependencies.sh $PROPAGATED_BRANCH branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh $PROPAGATED_BRANCH)
        fi
    fi
    if [ -e autogen.sh ]; then
        $CI_TIME ./autogen.sh 2> /dev/null
    fi
    if [ -e buildconf ]; then
        $CI_TIME ./buildconf 2> /dev/null
    fi
    if [ ! -e autogen.sh ] && [ ! -e buildconf ] && [ ! -e ./configure ] && [ -s ./configure.ac ]; then
        $CI_TIME libtoolize --copy --force && \
        $CI_TIME aclocal -I . && \
        $CI_TIME autoheader && \
        $CI_TIME automake --add-missing --copy && \
        $CI_TIME autoconf || \
        $CI_TIME autoreconf -fiv
    fi
    $CI_TIME ./configure "${CONFIG_OPTS[@]}"
    $CI_TIME make -j4
    $CI_TIME make install
    echo "Leaving from ${PWD}"
    cd "${BASE_PWD}"
    echo "Now in ${PWD}"
fi
fi


# Start of recipe for dependency: malamute
if ! (command -v dpkg-query >/dev/null 2>&1 && dpkg-query --list libmlm-dev >/dev/null 2>&1) || \
       (command -v brew >/dev/null 2>&1 && brew ls --versions malamute >/dev/null 2>&1) || \
       ([ -e "malamute" ]) \
; then

    FOLDER_NAME="malamute"

if [ -d "$FOLDER_NAME" ]; then
    echo "$FOLDER_NAME already exist. Skipped." >&2
else
    echo ""
    BASE_PWD=${PWD}
    echo "`date`: INFO: Building prerequisite 'malamute' from Git repository..." >&2
    if [ "x$REQUESTED_BRANCH" = "x" ]; then
        echo "git clone https://github.com/42ity/malamute.git $FOLDER_NAME"
        $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/malamute.git $FOLDER_NAME
    else
        if git ls-remote --heads https://github.com/42ity/malamute.git | grep -q "$REQUESTED_BRANCH"; then
            echo "git clone -b "$REQUESTED_BRANCH" https://github.com/42ity/malamute.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 -b "$REQUESTED_BRANCH" https://github.com/42ity/malamute.git $FOLDER_NAME
        else
            echo "$REQUESTED_BRANCH not found for https://github.com/42ity/malamute.git"
            echo "git clone https://github.com/42ity/malamute.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/malamute.git $FOLDER_NAME
        fi
    fi
    echo "Entering in ${PWD}/${FOLDER_NAME}"
    cd "./${FOLDER_NAME}"
    CCACHE_BASEDIR=${PWD}
    export CCACHE_BASEDIR
        git --no-pager log --oneline -n1
    if [ -e ci_dependencies.sh ]; then
        PROPAGATED_BRANCH="`git branch | grep \* | cut -d ' ' -f2`"
        DEFAULT_BRANCH="`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`"
        if [ "x$REQUESTED_BRANCH" = "x" ]; then
            echo "`date`: INFO: Building prerequisites of 'malamute' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        elif [ "x$PROPAGATED_BRANCH" = "x$DEFAULT_BRANCH" ]; then
            echo "`date`: INFO: Building prerequisites of 'malamute' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        else
            echo "`date`: INFO: Building prerequisites of 'malamute' using ci_dependencies.sh $PROPAGATED_BRANCH branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh $PROPAGATED_BRANCH)
        fi
    fi
    if [ -e autogen.sh ]; then
        $CI_TIME ./autogen.sh 2> /dev/null
    fi
    if [ -e buildconf ]; then
        $CI_TIME ./buildconf 2> /dev/null
    fi
    if [ ! -e autogen.sh ] && [ ! -e buildconf ] && [ ! -e ./configure ] && [ -s ./configure.ac ]; then
        $CI_TIME libtoolize --copy --force && \
        $CI_TIME aclocal -I . && \
        $CI_TIME autoheader && \
        $CI_TIME automake --add-missing --copy && \
        $CI_TIME autoconf || \
        $CI_TIME autoreconf -fiv
    fi
    $CI_TIME ./configure "${CONFIG_OPTS[@]}"
    $CI_TIME make -j4
    $CI_TIME make install
    echo "Leaving from ${PWD}"
    cd "${BASE_PWD}"
    echo "Now in ${PWD}"
fi
fi


# Start of recipe for dependency: cxxtools
if ! (command -v dpkg-query >/dev/null 2>&1 && dpkg-query --list cxxtools-dev >/dev/null 2>&1) || \
       (command -v brew >/dev/null 2>&1 && brew ls --versions cxxtools >/dev/null 2>&1) || \
       ([ -e "cxxtools" ]) \
; then

    FOLDER_NAME="cxxtools"

if [ -d "$FOLDER_NAME" ]; then
    echo "$FOLDER_NAME already exist. Skipped." >&2
else
    echo ""
    BASE_PWD=${PWD}
    echo "`date`: INFO: Building prerequisite 'cxxtools' from Git repository..." >&2
    if [ "x$REQUESTED_BRANCH" = "x" ]; then
        echo "git clone https://github.com/42ity/cxxtools.git $FOLDER_NAME"
        $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/cxxtools.git $FOLDER_NAME
    else
        if git ls-remote --heads https://github.com/42ity/cxxtools.git | grep -q "$REQUESTED_BRANCH"; then
            echo "git clone -b "$REQUESTED_BRANCH" https://github.com/42ity/cxxtools.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 -b "$REQUESTED_BRANCH" https://github.com/42ity/cxxtools.git $FOLDER_NAME
        else
            echo "$REQUESTED_BRANCH not found for https://github.com/42ity/cxxtools.git"
            echo "git clone https://github.com/42ity/cxxtools.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/cxxtools.git $FOLDER_NAME
        fi
    fi
    echo "Entering in ${PWD}/${FOLDER_NAME}"
    cd "./${FOLDER_NAME}"
    CCACHE_BASEDIR=${PWD}
    export CCACHE_BASEDIR
        git --no-pager log --oneline -n1
    if [ -e ci_dependencies.sh ]; then
        PROPAGATED_BRANCH="`git branch | grep \* | cut -d ' ' -f2`"
        DEFAULT_BRANCH="`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`"
        if [ "x$REQUESTED_BRANCH" = "x" ]; then
            echo "`date`: INFO: Building prerequisites of 'cxxtools' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        elif [ "x$PROPAGATED_BRANCH" = "x$DEFAULT_BRANCH" ]; then
            echo "`date`: INFO: Building prerequisites of 'cxxtools' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        else
            echo "`date`: INFO: Building prerequisites of 'cxxtools' using ci_dependencies.sh $PROPAGATED_BRANCH branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh $PROPAGATED_BRANCH)
        fi
    fi
    if [ -e autogen.sh ]; then
        $CI_TIME ./autogen.sh 2> /dev/null
    fi
    if [ -e buildconf ]; then
        $CI_TIME ./buildconf 2> /dev/null
    fi
    if [ ! -e autogen.sh ] && [ ! -e buildconf ] && [ ! -e ./configure ] && [ -s ./configure.ac ]; then
        $CI_TIME libtoolize --copy --force && \
        $CI_TIME aclocal -I . && \
        $CI_TIME autoheader && \
        $CI_TIME automake --add-missing --copy && \
        $CI_TIME autoconf || \
        $CI_TIME autoreconf -fiv
    fi
    $CI_TIME ./configure "${CONFIG_OPTS[@]}"
    $CI_TIME make -j4
    $CI_TIME make install
    echo "Leaving from ${PWD}"
    cd "${BASE_PWD}"
    echo "Now in ${PWD}"
fi
fi


# Start of recipe for dependency: fty-common-logging
if ! (command -v dpkg-query >/dev/null 2>&1 && dpkg-query --list libfty_common_logging-dev >/dev/null 2>&1) || \
       (command -v brew >/dev/null 2>&1 && brew ls --versions fty-common-logging >/dev/null 2>&1) || \
       ([ -e "fty-common-logging" ]) \
; then

    FOLDER_NAME="fty-common-logging"

if [ -d "$FOLDER_NAME" ]; then
    echo "$FOLDER_NAME already exist. Skipped." >&2
else
    echo ""
    BASE_PWD=${PWD}
    echo "`date`: INFO: Building prerequisite 'fty-common-logging' from Git repository..." >&2
    if [ "x$REQUESTED_BRANCH" = "x" ]; then
        echo "git clone https://github.com/42ity/fty-common-logging.git $FOLDER_NAME"
        $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/fty-common-logging.git $FOLDER_NAME
    else
        if git ls-remote --heads https://github.com/42ity/fty-common-logging.git | grep -q "$REQUESTED_BRANCH"; then
            echo "git clone -b "$REQUESTED_BRANCH" https://github.com/42ity/fty-common-logging.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 -b "$REQUESTED_BRANCH" https://github.com/42ity/fty-common-logging.git $FOLDER_NAME
        else
            echo "$REQUESTED_BRANCH not found for https://github.com/42ity/fty-common-logging.git"
            echo "git clone https://github.com/42ity/fty-common-logging.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/fty-common-logging.git $FOLDER_NAME
        fi
    fi
    echo "Entering in ${PWD}/${FOLDER_NAME}"
    cd "./${FOLDER_NAME}"
    CCACHE_BASEDIR=${PWD}
    export CCACHE_BASEDIR
        git --no-pager log --oneline -n1
    if [ -e ci_dependencies.sh ]; then
        PROPAGATED_BRANCH="`git branch | grep \* | cut -d ' ' -f2`"
        DEFAULT_BRANCH="`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`"
        if [ "x$REQUESTED_BRANCH" = "x" ]; then
            echo "`date`: INFO: Building prerequisites of 'fty-common-logging' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        elif [ "x$PROPAGATED_BRANCH" = "x$DEFAULT_BRANCH" ]; then
            echo "`date`: INFO: Building prerequisites of 'fty-common-logging' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        else
            echo "`date`: INFO: Building prerequisites of 'fty-common-logging' using ci_dependencies.sh $PROPAGATED_BRANCH branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh $PROPAGATED_BRANCH)
        fi
    fi
    if [ -e autogen.sh ]; then
        $CI_TIME ./autogen.sh 2> /dev/null
    fi
    if [ -e buildconf ]; then
        $CI_TIME ./buildconf 2> /dev/null
    fi
    if [ ! -e autogen.sh ] && [ ! -e buildconf ] && [ ! -e ./configure ] && [ -s ./configure.ac ]; then
        $CI_TIME libtoolize --copy --force && \
        $CI_TIME aclocal -I . && \
        $CI_TIME autoheader && \
        $CI_TIME automake --add-missing --copy && \
        $CI_TIME autoconf || \
        $CI_TIME autoreconf -fiv
    fi
    $CI_TIME ./configure "${CONFIG_OPTS[@]}"
    $CI_TIME make -j4
    $CI_TIME make install
    echo "Leaving from ${PWD}"
    cd "${BASE_PWD}"
    echo "Now in ${PWD}"
fi
fi


# Start of recipe for dependency: fty-common-mlm
if ! (command -v dpkg-query >/dev/null 2>&1 && dpkg-query --list libfty_common_mlm-dev >/dev/null 2>&1) || \
       (command -v brew >/dev/null 2>&1 && brew ls --versions fty-common-mlm >/dev/null 2>&1) || \
       ([ -e "fty-common-mlm" ]) \
; then

    FOLDER_NAME="fty-common-mlm"

if [ -d "$FOLDER_NAME" ]; then
    echo "$FOLDER_NAME already exist. Skipped." >&2
else
    echo ""
    BASE_PWD=${PWD}
    echo "`date`: INFO: Building prerequisite 'fty-common-mlm' from Git repository..." >&2
    if [ "x$REQUESTED_BRANCH" = "x" ]; then
        echo "git clone https://github.com/42ity/fty-common-mlm.git $FOLDER_NAME"
        $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/fty-common-mlm.git $FOLDER_NAME
    else
        if git ls-remote --heads https://github.com/42ity/fty-common-mlm.git | grep -q "$REQUESTED_BRANCH"; then
            echo "git clone -b "$REQUESTED_BRANCH" https://github.com/42ity/fty-common-mlm.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 -b "$REQUESTED_BRANCH" https://github.com/42ity/fty-common-mlm.git $FOLDER_NAME
        else
            echo "$REQUESTED_BRANCH not found for https://github.com/42ity/fty-common-mlm.git"
            echo "git clone https://github.com/42ity/fty-common-mlm.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/fty-common-mlm.git $FOLDER_NAME
        fi
    fi
    echo "Entering in ${PWD}/${FOLDER_NAME}"
    cd "./${FOLDER_NAME}"
    CCACHE_BASEDIR=${PWD}
    export CCACHE_BASEDIR
        git --no-pager log --oneline -n1
    if [ -e ci_dependencies.sh ]; then
        PROPAGATED_BRANCH="`git branch | grep \* | cut -d ' ' -f2`"
        DEFAULT_BRANCH="`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`"
        if [ "x$REQUESTED_BRANCH" = "x" ]; then
            echo "`date`: INFO: Building prerequisites of 'fty-common-mlm' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        elif [ "x$PROPAGATED_BRANCH" = "x$DEFAULT_BRANCH" ]; then
            echo "`date`: INFO: Building prerequisites of 'fty-common-mlm' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        else
            echo "`date`: INFO: Building prerequisites of 'fty-common-mlm' using ci_dependencies.sh $PROPAGATED_BRANCH branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh $PROPAGATED_BRANCH)
        fi
    fi
    if [ -e autogen.sh ]; then
        $CI_TIME ./autogen.sh 2> /dev/null
    fi
    if [ -e buildconf ]; then
        $CI_TIME ./buildconf 2> /dev/null
    fi
    if [ ! -e autogen.sh ] && [ ! -e buildconf ] && [ ! -e ./configure ] && [ -s ./configure.ac ]; then
        $CI_TIME libtoolize --copy --force && \
        $CI_TIME aclocal -I . && \
        $CI_TIME autoheader && \
        $CI_TIME automake --add-missing --copy && \
        $CI_TIME autoconf || \
        $CI_TIME autoreconf -fiv
    fi
    $CI_TIME ./configure "${CONFIG_OPTS[@]}"
    $CI_TIME make -j4
    $CI_TIME make install
    echo "Leaving from ${PWD}"
    cd "${BASE_PWD}"
    echo "Now in ${PWD}"
fi
fi


# Start of recipe for dependency: fty-common-socket
if ! (command -v dpkg-query >/dev/null 2>&1 && dpkg-query --list libfty_common_socket-dev >/dev/null 2>&1) || \
       (command -v brew >/dev/null 2>&1 && brew ls --versions fty-common-socket >/dev/null 2>&1) || \
       ([ -e "fty-common-socket" ]) \
; then

    FOLDER_NAME="fty-common-socket"

if [ -d "$FOLDER_NAME" ]; then
    echo "$FOLDER_NAME already exist. Skipped." >&2
else
    echo ""
    BASE_PWD=${PWD}
    echo "`date`: INFO: Building prerequisite 'fty-common-socket' from Git repository..." >&2
    if [ "x$REQUESTED_BRANCH" = "x" ]; then
        echo "git clone https://github.com/42ity/fty-common-socket.git $FOLDER_NAME"
        $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/fty-common-socket.git $FOLDER_NAME
    else
        if git ls-remote --heads https://github.com/42ity/fty-common-socket.git | grep -q "$REQUESTED_BRANCH"; then
            echo "git clone -b "$REQUESTED_BRANCH" https://github.com/42ity/fty-common-socket.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 -b "$REQUESTED_BRANCH" https://github.com/42ity/fty-common-socket.git $FOLDER_NAME
        else
            echo "$REQUESTED_BRANCH not found for https://github.com/42ity/fty-common-socket.git"
            echo "git clone https://github.com/42ity/fty-common-socket.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/fty-common-socket.git $FOLDER_NAME
        fi
    fi
    echo "Entering in ${PWD}/${FOLDER_NAME}"
    cd "./${FOLDER_NAME}"
    CCACHE_BASEDIR=${PWD}
    export CCACHE_BASEDIR
        git --no-pager log --oneline -n1
    if [ -e ci_dependencies.sh ]; then
        PROPAGATED_BRANCH="`git branch | grep \* | cut -d ' ' -f2`"
        DEFAULT_BRANCH="`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`"
        if [ "x$REQUESTED_BRANCH" = "x" ]; then
            echo "`date`: INFO: Building prerequisites of 'fty-common-socket' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        elif [ "x$PROPAGATED_BRANCH" = "x$DEFAULT_BRANCH" ]; then
            echo "`date`: INFO: Building prerequisites of 'fty-common-socket' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        else
            echo "`date`: INFO: Building prerequisites of 'fty-common-socket' using ci_dependencies.sh $PROPAGATED_BRANCH branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh $PROPAGATED_BRANCH)
        fi
    fi
    if [ -e autogen.sh ]; then
        $CI_TIME ./autogen.sh 2> /dev/null
    fi
    if [ -e buildconf ]; then
        $CI_TIME ./buildconf 2> /dev/null
    fi
    if [ ! -e autogen.sh ] && [ ! -e buildconf ] && [ ! -e ./configure ] && [ -s ./configure.ac ]; then
        $CI_TIME libtoolize --copy --force && \
        $CI_TIME aclocal -I . && \
        $CI_TIME autoheader && \
        $CI_TIME automake --add-missing --copy && \
        $CI_TIME autoconf || \
        $CI_TIME autoreconf -fiv
    fi
    $CI_TIME ./configure "${CONFIG_OPTS[@]}"
    $CI_TIME make -j4
    $CI_TIME make install
    echo "Leaving from ${PWD}"
    cd "${BASE_PWD}"
    echo "Now in ${PWD}"
fi
fi


# Start of recipe for dependency: fty-common-messagebus
if ! (command -v dpkg-query >/dev/null 2>&1 && dpkg-query --list libfty_common_messagebus-dev >/dev/null 2>&1) || \
       (command -v brew >/dev/null 2>&1 && brew ls --versions fty-common-messagebus >/dev/null 2>&1) || \
       ([ -e "fty-common-messagebus" ]) \
; then

    FOLDER_NAME="fty-common-messagebus"

if [ -d "$FOLDER_NAME" ]; then
    echo "$FOLDER_NAME already exist. Skipped." >&2
else
    echo ""
    BASE_PWD=${PWD}
    echo "`date`: INFO: Building prerequisite 'fty-common-messagebus' from Git repository..." >&2
    if [ "x$REQUESTED_BRANCH" = "x" ]; then
        echo "git clone https://github.com/42ity/fty-common-messagebus.git $FOLDER_NAME"
        $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/fty-common-messagebus.git $FOLDER_NAME
    else
        if git ls-remote --heads https://github.com/42ity/fty-common-messagebus.git | grep -q "$REQUESTED_BRANCH"; then
            echo "git clone -b "$REQUESTED_BRANCH" https://github.com/42ity/fty-common-messagebus.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 -b "$REQUESTED_BRANCH" https://github.com/42ity/fty-common-messagebus.git $FOLDER_NAME
        else
            echo "$REQUESTED_BRANCH not found for https://github.com/42ity/fty-common-messagebus.git"
            echo "git clone https://github.com/42ity/fty-common-messagebus.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/fty-common-messagebus.git $FOLDER_NAME
        fi
    fi
    echo "Entering in ${PWD}/${FOLDER_NAME}"
    cd "./${FOLDER_NAME}"
    CCACHE_BASEDIR=${PWD}
    export CCACHE_BASEDIR
        git --no-pager log --oneline -n1
    if [ -e ci_dependencies.sh ]; then
        PROPAGATED_BRANCH="`git branch | grep \* | cut -d ' ' -f2`"
        DEFAULT_BRANCH="`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`"
        if [ "x$REQUESTED_BRANCH" = "x" ]; then
            echo "`date`: INFO: Building prerequisites of 'fty-common-messagebus' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        elif [ "x$PROPAGATED_BRANCH" = "x$DEFAULT_BRANCH" ]; then
            echo "`date`: INFO: Building prerequisites of 'fty-common-messagebus' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        else
            echo "`date`: INFO: Building prerequisites of 'fty-common-messagebus' using ci_dependencies.sh $PROPAGATED_BRANCH branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh $PROPAGATED_BRANCH)
        fi
    fi
    if [ -e autogen.sh ]; then
        $CI_TIME ./autogen.sh 2> /dev/null
    fi
    if [ -e buildconf ]; then
        $CI_TIME ./buildconf 2> /dev/null
    fi
    if [ ! -e autogen.sh ] && [ ! -e buildconf ] && [ ! -e ./configure ] && [ -s ./configure.ac ]; then
        $CI_TIME libtoolize --copy --force && \
        $CI_TIME aclocal -I . && \
        $CI_TIME autoheader && \
        $CI_TIME automake --add-missing --copy && \
        $CI_TIME autoconf || \
        $CI_TIME autoreconf -fiv
    fi
    $CI_TIME ./configure "${CONFIG_OPTS[@]}"
    $CI_TIME make -j4
    $CI_TIME make install
    echo "Leaving from ${PWD}"
    cd "${BASE_PWD}"
    echo "Now in ${PWD}"
fi
fi


# Start of recipe for dependency: fty-common-dto
if ! (command -v dpkg-query >/dev/null 2>&1 && dpkg-query --list libfty_common_dto-dev >/dev/null 2>&1) || \
       (command -v brew >/dev/null 2>&1 && brew ls --versions fty-common-dto >/dev/null 2>&1) || \
       ([ -e "fty-common-dto" ]) \
; then

    FOLDER_NAME="fty-common-dto"

if [ -d "$FOLDER_NAME" ]; then
    echo "$FOLDER_NAME already exist. Skipped." >&2
else
    echo ""
    BASE_PWD=${PWD}
    echo "`date`: INFO: Building prerequisite 'fty-common-dto' from Git repository..." >&2
    if [ "x$REQUESTED_BRANCH" = "x" ]; then
        echo "git clone https://github.com/42ity/fty-common-dto.git $FOLDER_NAME"
        $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/fty-common-dto.git $FOLDER_NAME
    else
        if git ls-remote --heads https://github.com/42ity/fty-common-dto.git | grep -q "$REQUESTED_BRANCH"; then
            echo "git clone -b "$REQUESTED_BRANCH" https://github.com/42ity/fty-common-dto.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 -b "$REQUESTED_BRANCH" https://github.com/42ity/fty-common-dto.git $FOLDER_NAME
        else
            echo "$REQUESTED_BRANCH not found for https://github.com/42ity/fty-common-dto.git"
            echo "git clone https://github.com/42ity/fty-common-dto.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/fty-common-dto.git $FOLDER_NAME
        fi
    fi
    echo "Entering in ${PWD}/${FOLDER_NAME}"
    cd "./${FOLDER_NAME}"
    CCACHE_BASEDIR=${PWD}
    export CCACHE_BASEDIR
        git --no-pager log --oneline -n1
    if [ -e ci_dependencies.sh ]; then
        PROPAGATED_BRANCH="`git branch | grep \* | cut -d ' ' -f2`"
        DEFAULT_BRANCH="`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`"
        if [ "x$REQUESTED_BRANCH" = "x" ]; then
            echo "`date`: INFO: Building prerequisites of 'fty-common-dto' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        elif [ "x$PROPAGATED_BRANCH" = "x$DEFAULT_BRANCH" ]; then
            echo "`date`: INFO: Building prerequisites of 'fty-common-dto' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        else
            echo "`date`: INFO: Building prerequisites of 'fty-common-dto' using ci_dependencies.sh $PROPAGATED_BRANCH branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh $PROPAGATED_BRANCH)
        fi
    fi
    if [ -e autogen.sh ]; then
        $CI_TIME ./autogen.sh 2> /dev/null
    fi
    if [ -e buildconf ]; then
        $CI_TIME ./buildconf 2> /dev/null
    fi
    if [ ! -e autogen.sh ] && [ ! -e buildconf ] && [ ! -e ./configure ] && [ -s ./configure.ac ]; then
        $CI_TIME libtoolize --copy --force && \
        $CI_TIME aclocal -I . && \
        $CI_TIME autoheader && \
        $CI_TIME automake --add-missing --copy && \
        $CI_TIME autoconf || \
        $CI_TIME autoreconf -fiv
    fi
    $CI_TIME ./configure "${CONFIG_OPTS[@]}"
    $CI_TIME make -j4
    $CI_TIME make install
    echo "Leaving from ${PWD}"
    cd "${BASE_PWD}"
    echo "Now in ${PWD}"
fi
fi


# Start of recipe for dependency: protobuf
if ! (command -v dpkg-query >/dev/null 2>&1 && dpkg-query --list protobuf-dev >/dev/null 2>&1) || \
       (command -v brew >/dev/null 2>&1 && brew ls --versions protobuf >/dev/null 2>&1) || \
       ([ -e "protobuf" ]) \
; then

    FOLDER_NAME="protobuf"

if [ -d "$FOLDER_NAME" ]; then
    echo "$FOLDER_NAME already exist. Skipped." >&2
else
    echo ""
    BASE_PWD=${PWD}
    echo "`date`: INFO: Building prerequisite 'protobuf' from Git repository..." >&2
    if [ "x$REQUESTED_BRANCH" = "x" ]; then
        echo "git clone https://github.com/42ity/protobuf.git $FOLDER_NAME"
        $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/protobuf.git $FOLDER_NAME
    else
        if git ls-remote --heads https://github.com/42ity/protobuf.git | grep -q "$REQUESTED_BRANCH"; then
            echo "git clone -b "$REQUESTED_BRANCH" https://github.com/42ity/protobuf.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 -b "$REQUESTED_BRANCH" https://github.com/42ity/protobuf.git $FOLDER_NAME
        else
            echo "$REQUESTED_BRANCH not found for https://github.com/42ity/protobuf.git"
            echo "git clone https://github.com/42ity/protobuf.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/protobuf.git $FOLDER_NAME
        fi
    fi
    echo "Entering in ${PWD}/${FOLDER_NAME}"
    cd "./${FOLDER_NAME}"
    CCACHE_BASEDIR=${PWD}
    export CCACHE_BASEDIR
        git --no-pager log --oneline -n1
    if [ -e ci_dependencies.sh ]; then
        PROPAGATED_BRANCH="`git branch | grep \* | cut -d ' ' -f2`"
        DEFAULT_BRANCH="`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`"
        if [ "x$REQUESTED_BRANCH" = "x" ]; then
            echo "`date`: INFO: Building prerequisites of 'protobuf' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        elif [ "x$PROPAGATED_BRANCH" = "x$DEFAULT_BRANCH" ]; then
            echo "`date`: INFO: Building prerequisites of 'protobuf' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        else
            echo "`date`: INFO: Building prerequisites of 'protobuf' using ci_dependencies.sh $PROPAGATED_BRANCH branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh $PROPAGATED_BRANCH)
        fi
    fi
    if [ -e autogen.sh ]; then
        $CI_TIME ./autogen.sh 2> /dev/null
    fi
    if [ -e buildconf ]; then
        $CI_TIME ./buildconf 2> /dev/null
    fi
    if [ ! -e autogen.sh ] && [ ! -e buildconf ] && [ ! -e ./configure ] && [ -s ./configure.ac ]; then
        $CI_TIME libtoolize --copy --force && \
        $CI_TIME aclocal -I . && \
        $CI_TIME autoheader && \
        $CI_TIME automake --add-missing --copy && \
        $CI_TIME autoconf || \
        $CI_TIME autoreconf -fiv
    fi
    $CI_TIME ./configure "${CONFIG_OPTS[@]}"
    $CI_TIME make -j4
    $CI_TIME make install
    echo "Leaving from ${PWD}"
    cd "${BASE_PWD}"
    echo "Now in ${PWD}"
fi
fi


# Start of recipe for dependency: fty-lib-certificate
if ! (command -v dpkg-query >/dev/null 2>&1 && dpkg-query --list libfty_lib_certificate-dev >/dev/null 2>&1) || \
       (command -v brew >/dev/null 2>&1 && brew ls --versions fty-lib-certificate >/dev/null 2>&1) || \
       ([ -e "fty-lib-certificate" ]) \
; then

    FOLDER_NAME="fty-lib-certificate"

if [ -d "$FOLDER_NAME" ]; then
    echo "$FOLDER_NAME already exist. Skipped." >&2
else
    echo ""
    BASE_PWD=${PWD}
    echo "`date`: INFO: Building prerequisite 'fty-lib-certificate' from Git repository..." >&2
    if [ "x$REQUESTED_BRANCH" = "x" ]; then
        echo "git clone https://github.com/42ity/fty-lib-certificate.git $FOLDER_NAME"
        $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/fty-lib-certificate.git $FOLDER_NAME
    else
        if git ls-remote --heads https://github.com/42ity/fty-lib-certificate.git | grep -q "$REQUESTED_BRANCH"; then
            echo "git clone -b "$REQUESTED_BRANCH" https://github.com/42ity/fty-lib-certificate.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 -b "$REQUESTED_BRANCH" https://github.com/42ity/fty-lib-certificate.git $FOLDER_NAME
        else
            echo "$REQUESTED_BRANCH not found for https://github.com/42ity/fty-lib-certificate.git"
            echo "git clone https://github.com/42ity/fty-lib-certificate.git $FOLDER_NAME"
            $CI_TIME git clone --quiet --depth 1 https://github.com/42ity/fty-lib-certificate.git $FOLDER_NAME
        fi
    fi
    echo "Entering in ${PWD}/${FOLDER_NAME}"
    cd "./${FOLDER_NAME}"
    CCACHE_BASEDIR=${PWD}
    export CCACHE_BASEDIR
        git --no-pager log --oneline -n1
    if [ -e ci_dependencies.sh ]; then
        PROPAGATED_BRANCH="`git branch | grep \* | cut -d ' ' -f2`"
        DEFAULT_BRANCH="`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`"
        if [ "x$REQUESTED_BRANCH" = "x" ]; then
            echo "`date`: INFO: Building prerequisites of 'fty-lib-certificate' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        elif [ "x$PROPAGATED_BRANCH" = "x$DEFAULT_BRANCH" ]; then
            echo "`date`: INFO: Building prerequisites of 'fty-lib-certificate' using ci_dependencies.sh the default branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh)
        else
            echo "`date`: INFO: Building prerequisites of 'fty-lib-certificate' using ci_dependencies.sh $PROPAGATED_BRANCH branch..." >&2
            ($CI_TIME source ./ci_dependencies.sh $PROPAGATED_BRANCH)
        fi
    fi
    if [ -e autogen.sh ]; then
        $CI_TIME ./autogen.sh 2> /dev/null
    fi
    if [ -e buildconf ]; then
        $CI_TIME ./buildconf 2> /dev/null
    fi
    if [ ! -e autogen.sh ] && [ ! -e buildconf ] && [ ! -e ./configure ] && [ -s ./configure.ac ]; then
        $CI_TIME libtoolize --copy --force && \
        $CI_TIME aclocal -I . && \
        $CI_TIME autoheader && \
        $CI_TIME automake --add-missing --copy && \
        $CI_TIME autoconf || \
        $CI_TIME autoreconf -fiv
    fi
    $CI_TIME ./configure "${CONFIG_OPTS[@]}"
    $CI_TIME make -j4
    $CI_TIME make install
    echo "Leaving from ${PWD}"
    cd "${BASE_PWD}"
    echo "Now in ${PWD}"
fi
fi


# Start of recipe for dependency: systemd
if ! (command -v dpkg-query >/dev/null 2>&1 && dpkg-query --list libsystemd-dev >/dev/null 2>&1) || \
       (command -v brew >/dev/null 2>&1 && brew ls --versions systemd >/dev/null 2>&1) || \
       ([ -e "systemd" ]) \
; then
 echo "INFO: Get 'systemd' using apt-get libsystemd-dev" >&2
 sudo apt-get install libsystemd-dev -y || exit $?
fi


