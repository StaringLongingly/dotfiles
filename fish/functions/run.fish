function run --wraps='hyprctl dispatch -- exec' --description 'Wrapper for hyprctl exec'
  echo (set_color brblue)"Trying to run  :" \"$argv\"

  set working_directory (pwd)
  echo (set_color brcyan)"  In Directory :" \"$working_directory\"

  set nested_command cd \""$working_directory"\"\; \"$argv\"
  set final_command hyprctl dispatch -- exec "$nested_command" 
  echo (set_color brgreen)"  Final Command:" $final_command 

  $final_command > /dev/null
end
