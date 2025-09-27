function times --wraps=time --description 'alias times time'
  if test "$argv" = "date"
    date
    return
  end
  time $argv
        
end
