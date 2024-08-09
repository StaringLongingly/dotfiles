# Install yay
sudo pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay --save --answerdiff None --answerclean None --removemake

# Install the packages needed for the install
yay -S --needed acpi hyprwayland-scanner-git tgpt neovim neovide hyprland-git sddm mako wl-clipboard easyeffects kmix mpvpaper cool-retro-term parsec-bin fff waterfox-bin grimblast

# Rice up Neovim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Install the Sddm Theme
git clone https://github.com/nicefaa6waa/genshin-sddm-theme.git
cd genshin-sddm-theme
bash install-sddm-theme.sh
rm -r genshin-sddm-theme

# Setup Hyprland split workspaces
hyprpm update
hyprpm add https://github.com/shezdy/hyprsplit
hyprpm enable hyprsplit

# Finally starting Hyprland
Hyprland
