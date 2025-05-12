#!/bin/sh

waslastwindowviber=0
pending_resize_pid=""

handle() {
  case $1 in
    activewindow\>\>*)
      if [[ "$1" =~ "com.viber.Viber" ]]; then
        echo "Viber focused"
        # Kill any pending resize
        if [ -n "$pending_resize_pid" ]; then
          kill "$pending_resize_pid" 2>/dev/null
        fi
        # Start new resize with delay in background
        (sleep 0.6; hyprctl dispatch resizewindowpixel exact 784 100%, class:com.viber.Viber) &
        pending_resize_pid=$!
        hyprctl activemonitor
        waslastwindowviber=1
      elif [ $waslastwindowviber = 1 ]; then
        echo "Viber unfocused"
        # Kill pending resize if any
        if [ -n "$pending_resize_pid" ]; then
          kill "$pending_resize_pid" 2>/dev/null
          pending_resize_pid=""
        fi
        hyprctl dispatch resizewindowpixel exact 300 100%, class:com.viber.Viber
        waslastwindowviber=0
      fi
      ;;
  esac
}

# Cleanup on exit
cleanup() {
  if [ -n "$pending_resize_pid" ]; then
    kill "$pending_resize_pid" 2>/dev/null
  fi
}
trap cleanup EXIT

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
