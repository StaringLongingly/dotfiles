function reboot_into_windows 
    # Set up signal handling for SIGINT (Ctrl+C)
    function handle_interrupt --on-signal SIGINT
        echo -e "\n\nInterrupted! Staying in the GNU light ✨"
        return 130
    end
    
    # Check if the read command was interrupted
    if not read -l -P 'Are you really really REALLY sure you want to reboot to a bad OS? [Y\n] ' ans
        echo -e "\nInput interrupted, aborting reboot"
        return 130
    end
    
    switch $ans
        case Y y ''
            echo "Rebooting into Windows 11..."
            if sudo grub-reboot (awk -F\' '/menuentry / {print $2}' /boot/grub/grub.cfg | head -4 | tail -1)
                sudo reboot
            else
                echo "Error: Failed to set GRUB boot entry"
                return 1
            end
        case N n 
            echo "Aborting, we live to dance in the GNU light another day ✨"
        case '*'
            echo "Invalid input '$ans'. Please enter Y/y or N/n"
            return 1
    end
end
