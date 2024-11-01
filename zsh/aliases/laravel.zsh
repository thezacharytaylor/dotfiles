# Sail aliases
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

# Sail control
alias sud='sail up -d'
alias sdd='sail down'

# Sail commands
alias sart='sail artisan'
alias scom='sail composer'
alias sphp='sail php'
alias sam='sail artisan migrate'
