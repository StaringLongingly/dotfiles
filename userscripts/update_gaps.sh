#!/bin/bash

# Function to get all workspaces and their monitor info
get_workspace_info() {
    hyprctl workspaces | awk '
    /^workspace ID/ {
        # Extract workspace ID and monitor ID
        match($0, /workspace ID (-?[0-9]+).*on monitor ([^:]+):/, arr)
        workspace_id = arr[1]
        monitor_name = arr[2]
    }
    /monitorID:/ {
        monitor_id = $2
        print workspace_id "," monitor_name "," monitor_id
    }'
}

# Function to get all client/window information
get_client_info() {
    hyprctl clients | awk '
    /^Window [0-9a-f]+ ->/ {
        # Extract window ID and title
        match($0, /Window ([0-9a-f]+) -> (.+):/, arr)
        window_id = arr[1]
        window_title = arr[2]
    }
    /workspace:/ {
        # Extract workspace ID
        match($0, /workspace: (-?[0-9]+)/, arr)
        workspace_id = arr[1]
    }
    /monitor:/ {
        monitor_id = $2
    }
    /class:/ {
        class = $2
    }
    /title:/ {
        # Get everything after "title: "
        title = substr($0, index($0, $2))
        for(i=2; i<=NF; i++) {
            if(i==2) title = $i
            else title = title " " $i
        }
    }
    /pid:/ {
        pid = $2
        # Print all collected info for this window
        print window_id "," workspace_id "," monitor_id "," class "," title "," pid
    }'
}

# Get currently active workspaces on each monitor
get_active_workspaces() {
    hyprctl monitors | grep special | gawk '{print $3}'
}

# Function to perform action on a specific app/window
perform_app_action() {
    local address="0x$1"
    local is_active="$2"  # true if special workspace is active, false otherwise
    
    echo "Address: $address, Special Active: $is_active"
    
    if [[ "$is_active" == "true" ]]; then
        # Do something when special workspace is active
        hyprctl dispatch setprop address:$address noborder on 
        hyprctl dispatch setprop address:$address norounding on 
        hyprctl dispatch setprop address:$address noborder on 
    else
        # Do something when special workspace is inactive
        hyprctl dispatch setprop address:$address noborder off 
        hyprctl dispatch setprop address:$address norounding off 
        hyprctl dispatch setprop address:$address noborder off 

	hyprctl dispatch setprop address:$address activebordercolor rgba\(0, 0, 0, 0\) 
	hyprctl dispatch setprop address:$address inactivebordercolor rgba\(0, 0, 0, 0\) 
	hyprctl dispatch setprop address:$address rounding 20 
    fi
}

# Main logic
main() {
    # Get all workspace and client information
    workspace_info=$(get_workspace_info)
    client_info=$(get_client_info)
    active_workspaces=$(get_active_workspaces)
    
    # Create associative arrays
    declare -A monitors_with_special
    declare -A monitor_names
    
    # Parse workspace info and identify monitors with active special workspaces
    while IFS=',' read -r workspace_id monitor_name monitor_id; do
        monitor_names[$monitor_id]=$monitor_name
        
        # Check if this is a special workspace (negative ID) and is active
        if [[ $workspace_id -lt 0 ]]; then
            if echo "$active_workspaces" | grep -q "^$workspace_id$"; then
                monitors_with_special[$monitor_id]=1
                echo "Special workspace $workspace_id is active on monitor $monitor_name (ID: $monitor_id)"
            fi
        fi
    done <<< "$workspace_info"
    
    echo ""
    echo "Processing individual applications..."
    echo "=================================="
    
    # Process each client/window
    while IFS=',' read -r window_id workspace_id monitor_id class title pid; do
        # Skip empty lines
        [[ -z "$window_id" ]] && continue
        
        # Skip special workspaces (we only want to act on regular workspace apps)
        [[ $workspace_id -lt 0 ]] && continue
        
        # Determine if this window is on a monitor with active special workspaces
        if [[ ${monitors_with_special[$monitor_id]} ]]; then
            perform_app_action "$window_id" "true"
        else
            perform_app_action "$window_id" "false"
        fi
        
    done <<< "$client_info"
    
    echo "Processing complete."
}

# Run the main function
main
