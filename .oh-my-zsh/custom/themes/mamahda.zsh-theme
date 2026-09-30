# ==========================
# mamahda zsh theme (berbasis gianu)
#
#   [user@host dir (branch)] 12s                         [0:13:58]
#   $
#
# Branch hijau kalau bersih, merah kalau ada perubahan.
# Butuh `zstyle ':omz:alpha:lib:git' async-prompt no` di .zshrc (sebelum
# oh-my-zsh di-source), karena PROMPT dibangun ulang tiap precmd.
# ==========================

autoload -U colors && colors
autoload -Uz add-zsh-hook

# Lama eksekusi command terakhir, cuma ditampilkan kalau lebih dari 5 detik
_mamahda_cmd_exec_time() {
  local stop=$(date +%s)
  local start=${_mamahda_cmd_timestamp:-$stop}
  local elapsed=$(( stop - start ))
  [ $elapsed -gt 5 ] && echo "${elapsed}s"
}

_mamahda_venv_prompt() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "%{$fg_bold[magenta]%}($(basename $VIRTUAL_ENV))%{$reset_color%} "
  fi
}

# git_prompt_info nambahin DIRTY/CLEAN di belakang nama branch; dipakai sebagai
# penanda aja (":" nggak mungkin ada di nama branch/tag), warnanya diatur di bawah
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=":dirty"
ZSH_THEME_GIT_PROMPT_CLEAN=":clean"

# Nama branch hijau kalau bersih, merah kalau ada perubahan
_mamahda_git_info() {
  local info=$(git_prompt_info)
  [[ -n $info ]] || return 0
  local color=$fg_bold[green]
  [[ $info == *:dirty ]] && color=$fg_bold[red]
  echo "(%{$color%}${info%:*}%{$reset_color%})"
}

_mamahda_preexec() {
  _mamahda_cmd_timestamp=$(date +%s)
}

_mamahda_precmd() {
  # Baris atas: info di kiri, jam di ujung kanan (sejajar dengan [user@host dir])
  local left="[%{$fg_bold[white]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m%{$reset_color%} %{$fg[blue]%}%c%{$reset_color%} $(_mamahda_venv_prompt)$(_mamahda_git_info)%{$reset_color%}] %{$fg[yellow]%}$(_mamahda_cmd_exec_time)%f"
  local right="%{$fg[green]%}[%*]%{$reset_color%}${SSH_TTY:+ %n@%m}"
  unset _mamahda_cmd_timestamp

  # Hitung lebar teks yang kelihatan (tanpa kode warna) buat spasi pemisah
  local visible=${(%)left}${(%)right}
  visible=${(S)visible//$'\e'\[*m/}
  local pad=$(( COLUMNS - ${#visible} - 1 ))
  (( pad < 1 )) && pad=1

  PROMPT=$'\n'"${left}${(l:pad:)}${right}"$'\n$ '
  RPROMPT=''
}

add-zsh-hook preexec _mamahda_preexec
add-zsh-hook precmd _mamahda_precmd
