function proj() {
  if [ -z "${1}" ] ; then
    cd ~/proj
    ls -tcr1 # sort by change time in asc order, display in one column
  else
    GLB="*"; for ARG in $*; do GLB=$GLB$ARG"*"; done;
    FILES=$(sh -c "ls -r -d ~/proj/$GLB")
    echo $FILES
    IFS=$'\n' read _P <<< "$FILES"
    cd ${_P}
    _P=''
    FILES=''
  fi
}
