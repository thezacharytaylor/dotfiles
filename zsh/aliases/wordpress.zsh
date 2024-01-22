# setupwp

setupwp() {
  # clone repo
  if [[ "$#" -lt 3 ]]; then
    echo "Invalid number of arguments, expected 3. Client code, domain name, domain extension."
  fi

  git clone --depth=1 git@github.com:KineticTeam/$1-$2-$3.git $2 && cd $2
  wp core download
  
  if [[ -f DELETEME.zip ]]; then
    unzip DELETEME.zip
  fi
  
  if [[ ! -f wp-config.php ]]; then
    cp wp-config-sample.php wp-config.php
  fi

  v
}

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
    v
  else
    echo "No database file found."
  fi 
}
