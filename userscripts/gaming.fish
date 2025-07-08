#!/usr/bin/env -S fish -N

set -l disable_mangohud false
set -l disable_gamemoderun false
set -l disable_fan_override false
set -l disable_gpu_overclocking false
set -l show_help false
set -l game_args
for arg in $argv
    if string match -q -- '-*' "$arg"
        set -l flags (string sub --start 2 -- "$arg")
        if test -n "$flags"
            for i in (seq 1 (string length "$flags"))
                set -l flag (string sub --start $i --length 1 -- "$flags")
                switch $flag
                    case 'H'
                        set disable_mangohud true
                    case 'h'
                        set show_help true
                    case 'M'
                        set disable_gamemoderun true
                    case 'F'
                        set disable_fan_override true
                    case 'G'
                        set disable_gpu_overclocking true
                    case '*'
                        echo "Unknown flag: -$flag"
                        exit 1
                end
            end
        else
            echo "Invalid argument: $arg"
            exit 1
        end
    else
        set game_args $game_args $arg
    end
end
if test $show_help = true
    echo "Usage: gaming.fish [OPTIONS] [GAME_COMMAND]"
    echo ""
    echo "Options:"
    echo "  -H    Disable MangoHUD overlay"
    echo "  -h    Show this help message"
    echo "  -M    Disable GameMode optimizations"
    echo "  -F    Disable fan speed override"
    echo "  -G    Disable GPU overclocking"
    echo ""
    echo "Options can be combined (e.g., -HF, -FM, -HMF)"
    echo ""
    echo "Examples:"
    echo "  gaming.fish steam"
    echo "  gaming.fish -H lutris"
    echo "  gaming.fish -FM /path/to/game"
    echo "  gaming.fish -HMF wine game.exe"
    exit 0
end
if test (count $game_args) -eq 0
    echo "Error: No game command specified"
    echo "Use -h for help"
    exit 1
end

if test $disable_fan_override = false
    cat ~/Coding/password.txt | su -c 'nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=100" -a "[fan:1]/GPUTargetFanSpeed=100"' > /dev/null
    echo "Setting fan speed to max"
end

if test $disable_gpu_overclocking = false
    cat ~/Coding/password.txt | su -c 'nvidia-settings -a "[gpu:0]/GPUPowerMizerMode=1" -a "[gpu:0]/GPUMemoryTransferRateOffset[4]=100" -a "[gpu:0]/GPUGraphicsClockOffset[4]=100' > /dev/null
    echo "Initiating GPU overclocking"
end

set -l cmd

if test $disable_gamemoderun = false
    set cmd $cmd gamemoderun
end

if test $disable_mangohud = false
    set cmd $cmd mangohud
end

set cmd $cmd env PROTON_ENABLE_NGX_UPDATER=1 DXVK_NVAPI_DRS_NGX_DLSS_SR_OVERRIDE=on DXVK_NVAPI_DRS_NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest $game_args

eval $cmd

if test $disable_fan_override = false
    cat ~/Coding/password.txt | su -c 'nvidia-settings -a "[gpu:0]/GPUFanControlState=0"' > /dev/null
    echo "Resetting fan speed to normal"
end

if test $disable_fan_override = false
    cat ~/Coding/password.txt | su -c 'nvidia-settings -a "[gpu:0]/GPUPowerMizerMode=0"' > /dev/null
    echo "Resetting GPU Overclock"
end
