# Function to handle getting the bump data
get_bump() {
    read -n 1 -p "Version to bump; [m]ajor | m[i]nor | [p]atch: " TO_BUMP
    if [ "$TO_BUMP" = "p" ] || [ "$TO_BUMP" = "P" ]; then
        PATCH=$((PATCH + 1))
    elif [ "$TO_BUMP" = "i" ] || [ "$TO_BUMP" = "I" ]; then
        MINOR=$(($MINOR + 1))
        PATCH=0
    elif [ "$TO_BUMP" = "m" ] || [ "$TO_BUMP" = "M" ]; then
        MAJOR=$(($MAJOR + 1))
        MINOR=0
        PATCH=0
    else
        printf "\nIvalid choice. Try again or Ctrl+C to quit.\n"
        get_bump
    fi
}

# Function to handle doing the bump details
do_bump() {
    # Just use sed to replace the current version with the new version in shards.yml and xivapi-cr.cr
    sed -i "s/$CURRENT_VERSION/$NEW_VERSION/" shard.yml src/xivapi-cr.cr
}


CURRENT_VERSION=`shards version`
echo -e "Current Version: \e[33m$CURRENT_VERSION\e[0m"

# Split up the current version into major, minor and patch
VERSION_LIST=(`echo $CURRENT_VERSION | tr '.' ' '`)
MAJOR=${VERSION_LIST[0]}
MINOR=${VERSION_LIST[1]}
PATCH=${VERSION_LIST[2]}

# Handle the bumping
get_bump

# Set the new version
NEW_VERSION="$MAJOR.$MINOR.$PATCH"
printf "\n"
echo -e "New Version: \e[33m$NEW_VERSION\e[0m"
read -n 1 -p "Is this correct? [y]: " CORRECT
printf "\n"
if [ "$CORRECT" = "" ] || [ "$CORRECT" = "y" ] || [ "$CORRECT" = "Y" ]; then
    do_bump
    exit 0
fi
exit 1
