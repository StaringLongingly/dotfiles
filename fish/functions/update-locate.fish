function update-locate
  cat ~/Coding/password.txt | sudo updatedb; locate $argv
end
