
for i in $HOME/opt/*; do
  if [ -f "$i/bashrc" ]; then
    . "$i/bashrc"
  fi
done

