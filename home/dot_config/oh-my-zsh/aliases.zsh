setopt autocd # https://zsh.sourceforge.io/Doc/Release/Options.html#index-AUTOCD

alias \
  7z="7zz" \
  brewup="brew update && brew upgrade" \
  cafe="caffeinate" \
  cls="clear" \
  dockerprune="docker system prune --all --force --volumes" \
  exif="exiftool" \
  git-stash-changed="git stash push --keep-index --include-untracked" \
  localip="ipconfig getifaddr en0" \
  mimetype="file --brief --mime-type" \
  mkdirp="mkdir -p" \
  ncp="corepack" \
  pn="pnpm" \
  resudo="sudo !!" \
  rmrf="rm -f -R --" \
  symlink="ln -s" \
  sysinfo="sw_vers" \
  tf="terraform" \
  unquarantine="xattr -d com.apple.quarantine" \
  wh="builtin where" \
  whereami="builtin pwd " \
  whisper-cli="whisper-cli --model $XDG_DATA_HOME/whisper/ggml-small.bin" \
  yt="yt-dlp" \
  yt-mp4="yt-dlp --remux-video mp4" \
  yt-mp3="yt-dlp --format 'bestaudio*' --no-write-subs --extract-audio --audio-format mp3 --audio-quality 0 --no-embed-chapters"

# Get public IP address. Website created by the wonderful Major Hayden and is now
# managed by Cloudflare: https://major.io/p/a-new-future-for-icanhazip/
alias \
  ip="curl --silent --location --fail --show-error https://icanhazip.com" \
  ipv4="curl --silent --location --fail --show-error https://ipv4.icanhazip.com" \
  ipv6="curl --silent --location --fail --show-error https://ipv6.icanhazip.com"

# `now` uses `date` with specific format to get current instant as ISO 8601 date
# since `date -Iseconds` is not technically correct (+00:00 instead of Z)
alias \
  now="date -u +%Y-%m-%dT%H:%M:%SZ" \
  nowtz="date -Iseconds" \
  rfc2822="date -R" \
  timestamp="date +%s" \
  timestampms="FORCE_COLOR=0 node --print 'Date.now()'"

# These are technically longer but it's easier to remember. Note that if no
# files are passed to `wc`, it will read from stdin.
alias \
  linecount="wc -l" \
  charcount="wc -m" \
  wordcount="wc -w"

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
