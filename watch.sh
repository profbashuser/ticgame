# Set initial time of file
LTIME=`stat -c %Z src/main.nut`

while true; do
    # update time
    ATIME=`stat -c %Z src/main.nut`

    if [[ "$ATIME" != "$LTIME" ]]; then
        source ./build.sh
        LTIME=$ATIME
    else
		printf "\e[1;93mwatching\n"
	fi

    sleep 5 # update time
done
