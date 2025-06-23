function extract-protons --wraps='tar -xf ~/.steam/root/compatibilitytools.d/* -C ~/.steam/root/compatibilitytools.d/; rm -rf ~/.steam/root/compatibilitytools.d/*.tar*' --wraps='tar -xf ~/.steam/root/compatibilitytools.d/*.tar* -C ~/.steam/root/compatibilitytools.d/; rm -rf ~/.steam/root/compatibilitytools.d/*.tar*' --description 'alias extract-protons tar -xf ~/.steam/root/compatibilitytools.d/*.tar* -C ~/.steam/root/compatibilitytools.d/; rm -rf ~/.steam/root/compatibilitytools.d/*.tar*'
  tar -xf ~/.steam/root/compatibilitytools.d/*.tar* -C ~/.steam/root/compatibilitytools.d/; rm -rf ~/.steam/root/compatibilitytools.d/*.tar* $argv
        
end
