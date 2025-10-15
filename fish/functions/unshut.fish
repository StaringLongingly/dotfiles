function unshut --wraps='shutdown -c' --description 'alias unshut shutdown -c'
    shutdown -c $argv
end
