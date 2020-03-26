#!/bin/sh
#Created By Zhennan.luo

function goreportcardCli(){
  local gopath_src=$GOPATH/src
  local v_str=" -v $gopath_src:/go/src "
  if [ -n $APP_ROOT_DIR ];then
      v_str=" $v_str -v $APP_ROOT_DIR:$APP_ROOT_DIR "    
  fi
  docker run -it --rm $v_str jenner/goreportcard-cli goreportcard-cli $* 
}

function parseArgs(){
  while [[ $# -ge 1 ]];do
      case $1 in
          -d)
            APP_ROOT_DIR=$2
            shift 2
            ;;
          *)
            shift
            ;;
      esac
  done
}
if [ ! -n "$GOPATH" ];then
  echo "GOPATH does not exist!"
  exit 1
else
  parseArgs $*
  goreportcardCli $*
fi