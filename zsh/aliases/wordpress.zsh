# setupwp
# NOTE: SetupWP is a work in progress
# NOTE: Set your editor of choice with `export EDITOR="code -w"`
# Sets up WP for generic, brink, kadence, and sage 
# TODO: finish Kadence setup (from scratch)
# TODO: check if Brink needs any considerations
# TODO: Sage setup

# setupwp clientcode domainname domainextension [dbname] [kadence]
# flags: b = brink, g = generic, kadence
# TODO: Add Kadence plugin pull
# TODO: add call to sage build scripts
# TODO: add call to download mu-plugins
# TODO: add call to download kinsta mu-plugins
setupwp() {
  local dbname="DELETEME"
  local flag_b flag_g flag_k flag_K flag_s

  if [[ "$#" -lt 3 ]]; then
    echo "Invalid number of arguments, expected 3. Client code, domain name, domain extension."
    return
  fi

  while getopts ':dkKs' flag; do
    case "${flag}" in
      d) flag_b=true ;; # Brink
      g) flag_g=true ;; # Git, used for Kadence children
      k) flag_k=true ;; # Kadence
      K) flag_K=true ;; # Kinsta
      s) flag_s=true ;; # Sage
      *) error "Unexpected option ${flag}" ;;
    esac
  done

  # Conditionally shift positional arguments
  if [[ $flag_b || $flag_g || $flag_k || $flag_K || $flag_s ]]; then
    echo "Flags were used."
    shift # $((OPTIND-1))  # Adjust positional arguments
  else
    echo "No flags were used."
  fi

  # Set database name
  if [[ -n "$4" ]]; then
    dbname=$4
  fi

  # Factor in that this might be a kadence
  # TODO: add grabbing kadence plugins from somewhere?
  # TODO: add if check for making sure there is a 5th arg and switch to that for kadence
  # TODO: make dir if not in dir for kadence
  if [[ ! $flag_k && ! -d .git ]]; then
    echo "ran git pull on $1-$2-$3"
    # git clone --depth=1 git@github.com:KineticTeam/$1-$2-$3.git $2
  fi
  
  if [[ -f $dbname.zip ]]; then
    if [[ ! $flag_k ]]; then
      mv $2/* .
      rm -rf $2
    fi

    # wp core download
    echo "wp core download"
    unzip $dbname.zip
  elif [[ -d $2 ]]; then
    cd $2
    # wp core download
    echo "wp core download"
  else
    echo "No database file or directory found."
  fi
  
  if [[ ! -f wp-config.php ]]; then
    # Maybe add echo "define('WP_ENVIRONMENT_TYPE', 'local');" >> wp-config.php
    # Maybe use sed (free BSD on Mac) of brew gsed (gnu sed) to place it properly
    # cp wp-config-sample.php wp-config.php
    echo "wp config create"
  fi

  # valet secure $2
  # Launch editor
  $EDITOR wp-config.php
  # echo "lvim"
}

# finishwp olddomain newdomain [dbname]
finishwp() {
  local dbname="DELETEME"

  if [[ "$#" -lt 2 ]]; then
    echo "Invalid number of arguments, expected 2. Old domain name and test domain name."
  fi

  if [[ -n "$3" ]]; then
    dbname=$3
  fi

  if [[ -f $dbname.sql ]]; then
    wp db create
    wp db import $dbname.sql
    wp search-replace "$1" "$2" --all-tables
    wp cache flush

    # Launch editor
    lvim
  else
    echo "No database file found."
  fi 
}

# Get Kadence plugins and theme
getkadence() {
}

# Get Kinsta mu-plugins
getkinstamu() {
}

# Get mu-plugins
getmu() {

}
