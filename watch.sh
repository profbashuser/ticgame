# Set initial time of file
LTIME=`stat -c %Z src/main.nut`

while true; do
    # update time
    ATIME=`stat -c %Z src/main.nut`

    if [[ "$ATIME" != "$LTIME" ]]; then
        clear
        source ./build.sh
        LTIME=$ATIME
    fi

    sleep 5 # update time
done
