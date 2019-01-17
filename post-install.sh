#!/usr/bin/env sh

# fail if a command fails
set -e
set -o pipefail

# Do a security scan and remove it
$APP_DIR/secscan.sh && rm "$APP_DIR/secscan.sh"

# remove apk package manager
find / -type f -iname '*apk*' -xdev -delete
find / -type d -iname '*apk*' -print0 -xdev | xargs -0 rm -r --

# set rx to all directories, except data directory/
find "$APP_DIR" -type d -exec chmod 500 {} +

# set r to all files
find "$APP_DIR" -type f -exec chmod 400 {} +
chmod -R u=rwx "$DATA_DIR/"

# set run.sh executable
chmod u=rx $APP_DIR/run.sh

# chown all app files
chown $APP_USER:$APP_USER -R $APP_DIR $DATA_DIR

# finally remove this file
rm "$0"
