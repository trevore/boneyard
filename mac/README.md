# Mac setup

`install.sh` sets up a Mac:

- installs the packages in `Brewfile`: starship, eza, vim, byobu, htop, mtr, kubectl, kubectx, fzf, iTerm2 and JetBrains Mono Nerd Font
- installs the shell config (`zshrc` as `~/.zshrc.mac`, loaded from `~/.zshrc`), `vimrc` with vim-airline, and a starship config
- adds the "Boneyard" iTerm2 profile and makes it the default when iTerm2 isn't running
- applies the macOS settings in `defaults.sh` (Dock, Finder, dark mode, scrolling)

It's safe to re-run. Files it replaces are backed up as `*.bak.<time>`, except the ones it generates itself.

Written for Apple Silicon Macs (Homebrew in `/opt/homebrew`).

## Fresh Mac: copy and paste

Open Terminal (Applications → Utilities → Terminal) and paste this whole block:

```sh
{
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&
  git clone https://github.com/trevore/boneyard.git ~/git/boneyard &&
  ~/git/boneyard/mac/install.sh
}
```

What to expect:

1. The Homebrew installer asks for your password and for RETURN to continue. It also installs the Xcode Command Line Tools, which is where `git` comes from, so this step can take a while.
2. The repo is cloned to `~/git/boneyard` over HTTPS, so no SSH key is needed.
3. `install.sh` runs.

Keep the `{ }`: it makes the shell read the whole block before running any of it. Without them, the Homebrew installer reads the next pasted line as your answer to its prompt.

## After it finishes

1. Quit Terminal and open iTerm2. Boneyard should already be the default profile.
2. Log out and back in for the macOS settings.

If iTerm2 opens with its own default profile instead, or you ran `install.sh` from iTerm2 (it can't change the default while iTerm2 is open, so it prints this step), set it by hand: iTerm2 → Settings → Profiles → select "Boneyard" → Other Actions → Set as Default.

## Updating

```sh
git -C ~/git/boneyard pull && ~/git/boneyard/mac/install.sh
```

Then open a new terminal tab.

## Machine-only changes

Don't edit the files `install.sh` generates (`~/.zshrc.mac`, `~/.config/starship.toml`); they're overwritten on the next run. Instead:

- **Shell:** `~/.zshrc`. `install.sh` only appends the line that loads `~/.zshrc.mac`.
- **Vim:** `~/.vimrc.local`, which `vimrc` loads if it exists.
- **Starship:** `~/.config/starship.local.toml`, which is merged into the generated config. It can add top-level keys such as `format`, new modules such as `[custom.teleport]`, and sub-tables such as `[kubernetes.context_aliases]` or `[[kubernetes.contexts]]`. It can't repeat a table the generated config already has, such as `[kubernetes]`. `install.sh` stops with the error if the result doesn't parse, and keeps the old config.
