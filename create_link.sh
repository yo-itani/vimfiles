#!/bin/bash

SCRIPTDIR=$(dirname $0)
create_symlink() {
    ABSPATH="$(cd $(dirname $1) && pwd)"
    SRC="$ABSPATH/$(basename $1)"
    ABSPATH="$(cd $(dirname $2) && pwd)"
    DST="$ABSPATH/$(basename $2)"
    if [ -L "$DST" ]; then
        while :
        do
            echo -n "$DST symlink exists. overwrite ? [Y/n]: "
            read YESNO
            if [ "$YESNO" = "Y" ]; then
                rm "$DST"
                ln -s -v "$SRC" "$DST"
                break
            elif [ "$YESNO" = "n" ]; then
                break
            fi
        done
    elif [ -e "$DST" ]; then
        while :
        do
            echo "$2 exists. overwrite ? [Y/n]"
            read YESNO
            if [ "$YESNO" = "Y" ]; then
                BACKUPFILE=$DST.$(date +%Y%m%d)
                cp $DST $BACKUPFILE
                echo "backup file($BACKUPFILE) created"
                rm "$DST"
                ln -s -v "$SRC" "$DST"
                break
            elif [ "$YESNO" = "n" ]; then
                break
            fi
        done
    else
        ln -s -v "$SRC" "$DST"
    fi
}

SCRIPTDIR="$(cd $(dirname $0) && pwd)"
VUNDLEDIR="$SCRIPTDIR/.vim/bundle/Vundle.vim"
if ! [ -e "$VUNDLEDIR" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLEDIR
fi
create_symlink "$SCRIPTDIR/.vim" ~/.vim
create_symlink "$SCRIPTDIR/.vimrc" ~/.vimrc
STOP_UNDEF="stty stop undef"
grep "$STOP_UNDEF" ~/.bashrc > /dev/null
if [ $? = 1 ]; then
    echo "$STOP_UNDEF" >> ~/.bashrc
fi
