setopt autocd # https://zsh.sourceforge.io/Doc/Release/Options.html#index-AUTOCD

alias \
  7z="7zz" \
  cls="clear" \
  brewup="brew update && brew upgrade" \
  exif="exiftool" \
  localip="ipconfig getifaddr en0" \
  mimetype="file --brief --mime-type" \
  mkdirp="mkdir -p" \
  ncp="corepack" \
  pn="pnpm" \
  resudo="sudo !!" \
  rmrf="rm -f -R --" \
  symlink="ln -s" \
  tf="terraform" \
  wh="builtin where" \
  whereami="builtin pwd " \
  yt="yt-dlp"

# Get public IP address. Website created by the wonderful Major Hayden and is now
# managed by Cloudflare: https://major.io/p/a-new-future-for-icanhazip/
alias \
  ip="curl --silent --location --fail --show-error https://icanhazip.com" \
  ipv4="curl --silent --location --fail --show-error https://ipv4.icanhazip.com" \
  ipv6="curl --silent --location --fail --show-error https://ipv6.icanhazip.com"

# `now` uses ISO 8601 date format since `date -Iseconds` is not technically
# correct
alias \
  now="date +%Y-%m-%dT%H:%M:%S%z" \
  timestamp="date +%s" \
  timestampms="node --print 'Date.now()'"

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

# https://github.com/zsh-users/zsh/blob/master/Functions/Misc/zmv
autoload zmv
alias mmv="noglob zmv -W"

# Set suffix aliases
# https://www.stefanjudis.com/today-i-learned/suffix-aliases-in-zsh/
alias -s \
  git="takegit" \
  zip="takezip"

# Set named directory hash table
hash -d \
  dotfiles="${XDG_DATA_HOME}/chezmoi" \
  github="${HOME}/Github"
