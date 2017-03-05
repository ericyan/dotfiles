function lsp --description "List projects in workspace"
  find $GOPATH/src/ -mindepth 2 -maxdepth 3 -not -name .git -type d \
  | grep -P --only-matching --colour=never "^$GOPATH/src/\K.*"
end
