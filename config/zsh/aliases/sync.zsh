# kinsync mode source destination

kinsync() {
  local file="DELETEME"

  if [[ "$#" -lt 3 ]]; then
    echo "Invalid number of arguments, expected 3. mode (--dev or --open), source, destination."
  fi

  if [[ -n "$4" ]]; then
    file=$4
  fi

  if [[ $1 = '--dev' ]]; then
    echo "Attempting to get database, uploads, & plugins from dev server."
    rsync -vzP kin-dev:~/webapps/$2/{$file.zip,$file.sql} $3
    echo "Attempting to get wp-config.php from dev server."
    wpcsync --dev $2 $3
  elif [[ $1 = '--open' ]]; then
    rsync -vzP $2{$file.zip,$file.sql} $3
  else
    echo "Invalid mode"
  fi
}

# wpcsync mode source destination
# wpcrync --dev abc-abccompany-com/public .
# wpcsync abc:~/public_html .
wpcsync() {
  if [[ $1 = '--dev' ]]; then
    echo "Attempting to get wp-config.php from dev server."
    rsync -vzP kin-dev:~/webapps/$2/wp-config.php $3
  else
    echo "Attempting to get wp-config.php from requested server."
    rsync -vzP $2/wp-config.php $3
  fi
}
