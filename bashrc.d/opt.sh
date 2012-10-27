
for i in $HOME/Dropbox/Software/fedora/*; do
  if [ -f "$i/bashrc" ]; then
    . "$i/bashrc"
  fi
done

