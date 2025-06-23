function enable-ds-rename --wraps='mv ~/.config/wireplumber/wireplumber.conf.d/dualsense.conf.disabled ~/.config/wireplumber/wireplumber.conf.d/dualsense.conf; systemctl --user restart pipewire-session-manager.service' --description 'alias enable-ds-rename mv ~/.config/wireplumber/wireplumber.conf.d/dualsense.conf.disabled ~/.config/wireplumber/wireplumber.conf.d/dualsense.conf; systemctl --user restart pipewire-session-manager.service'
  mv ~/.config/wireplumber/wireplumber.conf.d/dualsense.conf.disabled ~/.config/wireplumber/wireplumber.conf.d/dualsense.conf; systemctl --user restart pipewire-session-manager.service $argv
        
end
