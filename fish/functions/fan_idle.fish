function fan_idle --wraps='su -c "nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=30""' --wraps='su -c "nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=30"" \\<\\<\\< "bousoulegkas"' --description 'alias fan_idle su -c "nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=30"" \\<\\<\\< "bousoulegkas"'
  su -c "nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=30"" <<< "bousoulegkas" $argv
        
end
