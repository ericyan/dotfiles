if [ -d ~/.profile.d ]; then
  for i in ~/.profile.d/*; do
    if [ -r $i -a -x $i ]; then
      . $i
    fi
  done
  unset i
fi
