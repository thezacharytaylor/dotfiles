# setupwp

# setupwp clientcode domainname domainextension [dbname]
setupwp() {
  local dbname="DELETEME"

  # clone repo
  if [[ "$#" -lt 3 ]]; then
    echo "Invalid number of arguments, expected 3. Client code, domain name, domain extension."
  fi

  if [[ -n "$4" ]]; then
    dbname=$4
  fi

  git clone --depth=1 git@github.com:KineticTeam/$1-$2-$3.git $2
  
  if [[ -f $dbname.zip ]]; then
    mv $2/* .
    rm -rf $2
    wp core download
    unzip $dbname.zip
  else
    cd $2
    wp core download
  fi
  
  if [[ ! -f wp-config.php ]]; then
    cp wp-config-sample.php wp-config.php
  fi

  # Launch editor
  lvim
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
