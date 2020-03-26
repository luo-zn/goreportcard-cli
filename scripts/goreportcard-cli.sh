#!/bin/bash
#Created By lzn

function goreportcard-cli(){
  local gopath_src=$GOPATH/src
  docker run -d -it --rm -v $gopath_src:/go/src jenner/goreportcard-cli $* 
}

if [ ! -n "$GOPATH" ];then
  echo "GOPATH does not exist!"
  exit 1
else
  goreportcard-cli $*
fi