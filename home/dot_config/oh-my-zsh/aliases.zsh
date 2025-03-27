alias \
  cls="clear" \
  brewup="brew update && brew upgrade" \
  exif="exiftool" \
  ncp="corepack" \
  pn="pnpm" \
  resudo="sudo !!" \
  symlink="ln -s" \
  tf="terraform" \
  wh="where" \
  yt="yt-dlp"

  # mkcd="takedir" \

# These are technically longer but it's easier to remember. Note that if no
# files are passed to `wc`, it will read from stdin.
alias \
  wordcount="wc -w" \
  charcount="wc -m"

# Set suffix aliases
# https://www.stefanjudis.com/today-i-learned/suffix-aliases-in-zsh/
alias -s git="takegit"

# Set named directory hash table
hash -d \
  dotfiles="$XDG_DATA_HOME/chezmoi" \
  github="$HOME/Github"
