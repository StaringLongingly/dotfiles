# Set up Aliases
alias unifetch 'unifetch --chafa ~/.config/hypr/zero_square.png'
alias hyprconf 'nvim ~/.config/hypr/hyprland.conf'
alias yay-clean 'yay --answerdiff None --answerclean All'
alias ai 'tgpt --provider deepseek'
alias silence 'killall -9'
alias background 'nohup'

function yay-sr --wraps yay --description 'Searches and Removes the first package found in the search'
  echo "Searching and Removing for: $argv"
  yay -R $(pacman -Qq | grep $argv)
end

function find-edit --wraps nvim --description 'Searches for a file and opens it in nvim'
  nvim $(whereis $argv | gawk '{ print $2 };' )
end

# Run Unifetch or Hyprland depending if the system just booted
if status is-login 
  Hyprland > /dev/null
end

unifetch

# Make It look Pretty
starship init fish | source
