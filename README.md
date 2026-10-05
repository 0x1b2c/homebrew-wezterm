# homebrew-wezterm

A Homebrew tap for [0x1b2c's fork of WezTerm](https://github.com/0x1b2c/wezterm).
It provides one cask, `wezterm-1b2c`, which installs the macOS packages
published on the fork's GitHub Releases (arm64 and x86_64).

## Install

```sh
brew install --cask 0x1b2c/wezterm/wezterm-1b2c
```

The cask conflicts with the official `wezterm` and `wezterm@nightly` casks,
because they link executables of the same names. Uninstall one before
installing the other.

## Quarantine

The packages are ad-hoc signed, not notarized. After installing, the cask runs
`xattr -cr` on `WezTerm.app` to clear the quarantine attribute, so macOS does
not refuse to open the app. This is the only change the cask makes to the
downloaded app.
