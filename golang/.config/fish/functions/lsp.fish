function lsp --description "List projects in workspace"
  find $GOPATH/src -mindepth 2 -maxdepth 3 -not -name .git -type d \
  | sed -e "s|^$GOPATH/src/||"
end
