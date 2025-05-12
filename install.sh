cd
# Install yay
echo "Installing yay"
sudo pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

echo "Copying config files"
mkdir .config
cp * .config/

echo "Copying user scripts"
sudo cp userscripts/* /usr/local/bin

yay --save --answerdiff None --answerclean None --removemake

# Install the packages needed for the install
echo "Installing basic packages"
yay -S --needed xdg-desktop-portal-hyprland-git pkg-config kitty cpio cmake acpi hyprwayland-scanner-git neovim hyprland-git sddm mako wl-clipboard easyeffects kmix pavucontrol-qt mpvpaper parsec-bin waterfox-bin grimblast hyprpaper sirula swayosd-git vesktop plocate

# Nvidia Drivers (can disable)
echo "Installing nvidia drivers"
yay -S nvidia-nouveau nvidia-utils nvidia-open-dkms lib32-vulkan-nouveau vulkan-headers mangohud gamemode mangoverlay

# Rice up Neovim
echo "Configuring Neovim"
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Setup Hyprland split workspaces
echo "Installing Hyprland plugins"
hyprpm update
hyprpm add https://github.com/shezdy/hyprsplit
hyprpm enable hyprsplit
hyprpm update

# Finally starting Hyprland
Hyprland
