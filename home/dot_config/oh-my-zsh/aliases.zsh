alias \
  cls="clear" \
  brewup="brew update && brew upgrade" \
  exif="exiftool" \
  ncp="corepack" \
  pn="pnpm" \
  resudo="sudo !!" \
  symlink="ln -s" \
  tf="terraform" \
  wh="builtin where" \
  yt="yt-dlp"

# These are technically longer but it's easier to remember. Note that if no
# files are passed to `wc`, it will read from stdin.
alias \
  wordcount="wc -w" \
  charcount="wc -m"

# Flushes the entire Directory Service cache and send a hangup signal to DNS
# daemon
# https://support.apple.com/en-us/101481
# https://github.com/apple-oss-distributions/mDNSResponder
alias flushdns="sudo dscacheutil -flushcache && sudo killall -SIGHUP mDNSResponder"

# Set suffix aliases
# https://www.stefanjudis.com/today-i-learned/suffix-aliases-in-zsh/
alias -s \
  zip="takezip" \
  git="takegit"

# Set named directory hash table
hash -d \
  dotfiles="${XDG_DATA_HOME}/chezmoi" \
  github="${HOME}/Github"
