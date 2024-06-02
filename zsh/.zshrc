# Main settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=robbyrussell
plugins=(
  brew
  dotenv
  git
  macos
  npm
  vscode
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-nvm
)
ZSH_CUSTOM=$HOME/.dotfiles/oh-my-zsh

# Update settings
zstyle ':omz:update' mode auto

# Completion settings
COMPLETION_WAITING_DOTS=true

# Library settings
ENABLE_CORRECTION=true
HIST_STAMPS="mm/dd/yyyy"

# NVM configuration
NVM_COMPLETION=true
NVM_AUTO_USE=true

source $ZSH/oh-my-zsh.sh

# Prefer U.S. English and UTF-8 (https://en.wikipedia.org/wiki/UTF-8).
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

export FORCE_COLOR=1 # https://force-color.org

# Required in non-W32 environments, so `pinentry` program is displayed in terminal.
# https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
export GPG_TTY=$(tty);

# Homebrew
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_BUNDLE_FILE_GLOBAL="$HOME/.dotfiles/Brewfile"

# NPM
export ADBLOCK=1
export DISABLE_OPENCOLLECTIVE=1

# Aliases
alias cls='clear'
alias la='ls -A'

# Telemetry
export DO_NOT_TRACK=1 # https://consoledonottrack.com
export ALGOLIA_CLI_TELEMETRY=0 # Algolia
export AMPLIFY_DISABLE_TELEMETRY=1 # AWS Amplify
export APOLLO_TELEMETRY_DISABLED=1 # Apollo Router/Rover
export ARDUINO_METRICS_ENABLED=false # Arduino
export ASTRO_TELEMETRY_DISABLED=1 # Astro
export AZURE_CORE_COLLECT_TELEMETRY=0 # Azure
export CALCOM_TELEMTRY_DISABLED=1 # Cal.com
export CHECKPOINT_DISABLE=1 # Prisma, Terraform
export CLOUDSDK_CORE_DISABLE_USAGE_REPORTING=true # Google Cloud SDK
export DA_TEST_DISABLE_TELEMETRY=1 # JavaScript Debugger (VSCode)
export DATAHUB_TELEMETRY_ENABLED=false # DataHub
export DDB_LOCAL_TELEMETRY=0 # DynamoDB
export DISABLE_ZAPIER_ANALYTICS=1 # Zapier
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # .NET
export DOTNET_INTERACTIVE_CLI_TELEMETRY_OPTOUT=1 # .NET Interactive
export EXPO_NO_TELEMETRY=1 # Expo
export GATSBY_TELEMETRY_DISABLED=1 # Gatsby
export GOTELEMETRY=off # Go
export HASURA_GRAPHQL_ENABLE_TELEMETRY=false # Hasura
export HOMEBREW_NO_ANALYTICS=1 # Homebrew
export MSSQL_TELEMETRY_ENABLED=FALSE # Azure SQL Edge
export NEXT_TELEMETRY_DISABLED=1 # Next.js
export NG_CLI_ANALYTICS=false # Angular CLI
export NUXT_TELEMETRY_DISABLED=1 # Nuxt.js
export SAM_CLI_TELEMETRY=0 # AWS SAM
export SFDX_DISABLE_TELEMETRY=true # Salesforce CLI
export SLS_TELEMETRY_DISABLED=1 # Serverless Framework
export SST_TELEMETRY_DISABLED=1 # SST
export STORYBOOK_DISABLE_TELEMETRY=1 # Storybook
export STRIPE_CLI_TELEMETRY_OPTOUT=1 # Stripe
export YARN_ENABLE_TELEMETRY=0 # Yarn
