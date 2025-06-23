function disable-ds-rename --wraps='mv ~/.config/wireplumber/wireplumber.conf.d/dualsense.conf ~/.config/wireplumber/wireplumber.conf.d/dualsense.conf.disabled; systemctl --user restart pipewire-session-manager.service' --description 'alias disable-ds-rename mv ~/.config/wireplumber/wireplumber.conf.d/dualsense.conf ~/.config/wireplumber/wireplumber.conf.d/dualsense.conf.disabled; systemctl --user restart pipewire-session-manager.service'
  mv ~/.config/wireplumber/wireplumber.conf.d/dualsense.conf ~/.config/wireplumber/wireplumber.conf.d/dualsense.conf.disabled; systemctl --user restart pipewire-session-manager.service $argv
        
end
