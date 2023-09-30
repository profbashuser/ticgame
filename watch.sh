### Set initial time of file
LTIME=`stat -c %Z src/main.nut`

while true    
do
ATIME=`stat -c %Z src/main.nut`

if [[ "$ATIME" != "$LTIME" ]]; then    
        echo "RUN COMMAND"
        LTIME=$ATIME
    fi
    sleep 5 # update time
done