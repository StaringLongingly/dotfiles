cd ~/.config
cp -r sirula wofi fish hypr unifetch cava cool-retro-term.json kitty kew ~/Coding/dotfiles/
sudo cp /usr/local/bin/* ~/Coding/dotfiles/userscripts
cd ~/Coding/dotfiles
git add *
git commit -m "$(date)"
git push
