# .bashrc: executed by bash(1) for non-login shells.

run_scripts() {
  for script in $(find -L $1 -name '*.sh' -type f | sort); do
    . $script
  done
}

run_scripts "$HOME/.bashrc.d"
