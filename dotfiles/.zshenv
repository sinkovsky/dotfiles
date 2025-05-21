alias assume=". assume"

alias gco='git checkout $(_fzf_git_branches)'
alias gri='git rebase -i HEAD~2'
alias gps='git push origin $(_fzf_git_branches)'
alias gpl='git pull origin $(_fzf_git_branches)'
alias gad='git add $(_fzf_git_files)'

source ~/.iterm2_shell_integration.zsh
source ~/bin/fzf-git.sh/fzf-git.sh
fpath=(/Users/sergiy/.granted/zsh_autocomplete/assume/ $fpath)

fpath=(/Users/sergiy/.granted/zsh_autocomplete/granted/ $fpath)

shrink-path-toggle() {
  zstyle -t ':prompt:shrink_path' expand \
    && zstyle -d ':prompt:shrink_path' expand \
    || zstyle ':prompt:shrink_path' expand true
  zle reset-prompt
}
zle -N shrink-path-toggle
# Key binding to ALT+SHIFT+S

npmrun() {
  if cat package.json > /dev/null 2>&1; then
    selected_script=$(cat package.json | jq .scripts | sed '1d;$d' | fzf --cycle --height 80% --header="Press ENTER to run the script. ESC to quit.");

    if [[ -n "$selected_script" ]]; then
        script_name=$(echo "$selected_script" | awk -F ': ' '{gsub(/"/, "", $1); print $1}' | awk '{$1=$1};1')
        print -s "npm run "$script_name;
        npm run $script_name;
    else
        echo "Exit: You haven't selected any script"
    fi
  else
    echo "Error: There's no package.json"
  fi
}

