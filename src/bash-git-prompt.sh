#!/bin/bash
# Setup bash-git-prompt lib

GIT_PROMPT_THEME=Solarized
GIT_PROMPT_ONLY_IN_REPO=1

if [ -f "${DOTFILES_DIR}/libs/bash-git-prompt/gitprompt.sh" ]; then
    source ${DOTFILES_DIR}/libs/bash-git-prompt/gitprompt.sh
fi
