alias tw=timew

# Summary
alias tws='timew summary'
alias twsi='timew summary :ids'
alias twsia='timew summary :ids :annotations'
alias twsy='timew summary :yesterday'
alias twsw='timew summary :week'
alias twds='timew day summary'
alias twws='timew week summary'
alias twms='timew month summary'

# Tracking
alias twa='timew start'
alias two='timew stop'
alias twc='timew continue'
alias twt='timew track'
alias twl='timew lengthen'
alias twsh='timew shorten'
alias twm='timew modify'
alias twma='timew modify start'
alias twmo='timew modify end'
alias twrs='timew resize'
alias twz='timew undo'
alias twd='timew delete'

# Labeling
alias twann='timew annotate'
alias twtag='timew tag'

# Functions
# Start, tag, annotate, and optionally backdate
# TODO: add support for multiple tags
# TODO: add support for no tag
# TODO: add support for no annotation
twaa() {
  local tag="kin";
  local ann="Miscellaneous";

  echo $1 $3 "$2"
  if [[ -n "$1" ]]; then
    tag="$1"
  fi

  if [[ -n "$2" ]]; then
    ann="$2"
  fi
    
  if [[ -n "$3" ]]; then
    twa $3 ago $tag && twann $ann
  else
    twa $tag && twann $ann
  fi
}

