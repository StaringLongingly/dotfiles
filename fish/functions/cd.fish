function cd --description 'Changes Directory & Shows the files inside of it'
    if test -f $argv
        set argv ~
    end
    if [ (count (ls $argv)) -lt "20" ]
        ls $argv
    else
        set_color brmagenta; echo "File Count: "(count (ls $argv))
    end
    builtin cd $argv
end
