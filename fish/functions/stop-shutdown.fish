function stop-shutdown --wraps='sudo systemctl stop daily-shutdown.timer' --description 'alias stop-shutdown sudo systemctl stop daily-shutdown.timer'
  sudo systemctl stop daily-shutdown.timer $argv
        
end
