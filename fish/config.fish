# Set up Aliases
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

# Run Hyprland depending if the system just booted
if status is-login; and [ (tty) = '/dev/tty1' ]
 Hyprland > /dev/null
end

# Make It look Pretty
starship init fish | source
