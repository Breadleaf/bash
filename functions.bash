######################################################

# Functions

######################################################

alias edbf="vim ~/.config/bash/functions.bash"

vim ()
{
	if command -v nvim > /dev/null 2>&1; then
		nvim "$@"
	elif command -v vim > /dev/null 2>&1; then
		vim "$@"
	else
		echo "Please install neovim or vim"
	fi

}

yt-cli ()
{
	local youtube_regex="^(https?://)?(www\.)?(youtube\.com|youtu\.be)/.+$"

	if [ $# -ne 1 ]; then
		echo "Usage: yt-cli [Youtube URL]"
		return 1
	elif [[ $1 =~ $youtube_regex ]]; then
		if curl --output /dev/null --silent --head --fail "$1"; then
			vlc $(yt-dlp -f best -g $1)
		else
			echo "Invalid URL!"
			echo "Usage: yt-cli [Youtube URL]"
			return 1
		fi
    	else
		echo "Invalid URL!"
		echo "Usage: yt-cli [Youtube URL]"
		return 1
	fi
}
