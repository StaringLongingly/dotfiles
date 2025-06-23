function build-hp --description 'Clean build Proton-Haptics-Patch'
  set previous_dir $(pwd)
  cd ~/Coding/proton_build
  rm -rf ./*
  ../proton/configure.sh --enable-ccache --build-name=Proton-10.0-Haptics-Patch
  make install > /dev/null
  cd $previous_dir
end
