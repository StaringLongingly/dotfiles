# Install yay
sudo pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
rm -rf yay-bin

cp * .config/

yay --save --answerdiff None --answerclean None --removemake

# Install the packages needed for the install
yay -S --needed xdg-desktop-portal-hyprland-git pkg-config kitty cpio cmake acpi hyprwayland-scanner-git tgpt neovim neovide hyprland-git sddm mako wl-clipboard easyeffects kmix mpvpaper cool-retro-term parsec-bin fff waterfox-bin grimblast hyprpaper sirula swayosd-git vesktop plocate

# Nvidia Drivers (can disable)
yay -S nvidia-nouveau nvidia-utils nvidia-open-dkms lib32-vulkan-nouveau vulkan-headers mangohud gamemode

# Rice up Neovim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Setup Hyprland split workspaces
hyprpm update
hyprpm add https://github.com/shezdy/hyprsplit
hyprpm enable hyprsplit

# Finally starting Hyprland
Hyprland
