#===========================================================
# History
#===========================================================

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

#===========================================================
# Shell behaviour
#===========================================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT #sort file10 after file9, not after file1


#===========================================================
# Smart directory navigation
#===========================================================

#Initialize zoxide
eval "$(zoxide init zsh)"


#===========================================================
# Completion
#===========================================================

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # lowercase input match

#===========================================================
# Fuzzy Finder
#===========================================================

# README FEDORA

# fzf provides several niceties, such as shell completion, shell key bindings,
# and a vim plugin. In Fedora, we only enable the shell completion and install
# the plugin for vim and neovim by default as they are generally non-intrusive.
# The key bindings are installed but not enabled.

if [[ -f /usr/share/fzf/shell/key-bindings.zsh ]]; then
	source /usr/share/fzf/shell/key-bindings.zsh
fi

#===========================================================
# Modular Config Files
#===========================================================

# fzf configuration
source "$ZDOTDIR/fzf.zsh"

# Aliases
source "$ZDOTDIR/aliases.zsh"

# Custom keybindings
source "$ZDOTDIR/bindings.zsh"

# Plugins and plugin manager
source "$ZDOTDIR/plugins.zsh"

# Prompt/theme
source "$ZDOTDIR/prompt.zsh"
