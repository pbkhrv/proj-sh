# Root of all project directories
PROJ_BASE_DIR=~/proj

# Output the list of all project directories that match the "fuzzy" pattern
function _proj_ls() {
  if [ -n "${1}" ] ; then
    GLB="*"; for ARG in $*; do GLB=$GLB$ARG"*"; done;
    FILES=$(sh -c "ls -r -d $PROJ_BASE_DIR/$GLB")
    echo $FILES
  fi
}

# Output the name of the matching directory with most recent modification time
function projd() {
  if [ -n "${1}" ] ; then
    FILES=$(_proj_ls $*)
    IFS=$'\n' read _P <<< "$FILES"
    echo ${_P}
    _P=''
    FILES=''
  fi
}

# cd into the matching directory with the most recent modification time
function proj() {
  if [ -z "${1}" ] ; then
    cd ~/proj
    ls -tcr1 # sort by change time in asc order, display in one column
  else
    OFS=$'\n' _proj_ls $*
    cd $(projd $*)
  fi
}

