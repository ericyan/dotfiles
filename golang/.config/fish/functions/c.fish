function c --description "Change directory to project"
  cd "$GOPATH/src/$argv"
end

complete --command c --arguments '(lsp)'
