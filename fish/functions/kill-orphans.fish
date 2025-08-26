function kill-orphans --wraps='yay -R (yay -Qdtq)' --description 'alias kill-orphans yay -R (yay -Qdtq)'
  yay -R (yay -Qdtq) $argv
        
end
