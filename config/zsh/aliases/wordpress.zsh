# Setup WordPress Locally Functions
# NOTE: SetupWP is a work in progress
# Sets up WP for generic, & sage 
# Two functions: setupwp (complete rework) and finishwp largely handle the process
# setupwp gets everything going then allows you to edit wp-config.php
# before moving on.
# NOTE: Set your editor of choice with `export EDITOR="code -w"`
# TODO: Sage setup

# finishwp olddomain newdomain [dbname]
finishwp() {
  local db_name="DELETEME"

  if [[ "$#" -lt 2 ]]; then
    echo "Invalid number of arguments, expected 2. Old domain name and test domain name."
  fi

  if [[ -n "$3" ]]; then
    db_name=$3
  fi

  if [[ -f $db_name.sql ]]; then
    wp db create
    wp db import $db_name.sql
    wp search-replace "$1" "$2" --all-tables
    wp cache flush

    # Launch editor
    $EDITOR .
  else
    echo "No database file found."
  fi 
}
