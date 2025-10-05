function yt-flac --wraps='yt-dlp -f bestaudio --embed-thumbnail --audio-format flac -x' --wraps='yt-dlp -f bestaudio --embed-thumbnail --embed-metadata --audio-format flac -x' --description 'alias yt-flac yt-dlp -f bestaudio --embed-thumbnail --embed-metadata --audio-format flac -x'
    yt-dlp -f bestaudio --embed-thumbnail --embed-metadata --audio-format flac -x $argv
end
