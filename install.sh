# Install yay
pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

# Install the packages needed for the install
yay -S tgpt neovim neovide hyprland sddm mako wl-clipboard easyeffects kmix mpvpaper cool-retro-term parsecd fff waterfox grimblast

# Rice up Neovim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Install the Sddm Theme
git clone https://github.com/nicefaa6waa/genshin-sddm-theme.git
cd genshin-sddm-theme
bash install-sddm-theme.sh
rm -r genshin-sddm-theme

# Finally starting Hyprland
Hyprland
