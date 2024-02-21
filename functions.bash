######################################################

# Functions

######################################################

alias edbf="vim ~/.config/bash/functions.bash"

ve ()
{
	help="Command Syntax:\nve -flag <file-name>\nve -p : python3\nve --cpp : cpp\nve -c : c"

	case $1 in
		"-h")
			echo -e $help
			;;
		"-p")
			clear && vim $2 && python3 $2
			;;
		"--cpp")
			clear && vim $2 && g++ $2 && ./a.out
			;;
		"-c")
			clear && vim $2 && gcc $2 && ./a.out
			;;
		*)
			echo -e $help
			;;
	esac
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
