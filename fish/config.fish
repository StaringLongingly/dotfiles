# Set up Aliases
alias unifetch 'unifetch --chafa ~/.config/hypr/zero_square.png'
alias hyprconf 'nvim ~/.config/hypr/hyprland.conf'
alias yay-clean 'yay --answerdiff None --answerclean All'
alias ai 'tgpt --provider deepseek'
alias silence 'killall -9'
alias background 'nohup'

# Run Unifetch or Hyprland depending if the system just booted
if status is-login 
  Hyprland > /dev/null
end

unifetch

# Make It look Pretty
starship init fish | source
