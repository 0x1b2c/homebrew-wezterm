cask "wezterm-1b2c" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.0"
  sha256 arm:   "5e55936f2bbcdd0813ad53c95b91634d4af5fb8966fa63d77cd052fe2a5b59a2",
         intel: "4056280f0fdfc7fdbb3822f6663b5141f3e8d0e6d1fbcf1a58c8841c81f246a2"

  url "https://github.com/0x1b2c/wezterm/releases/download/1b2c-#{version}/WezTerm-1b2c-#{version}-macos-#{arch}.zip"
  name "WezTerm (1b2c fork)"
  desc "Fork of the WezTerm terminal emulator and multiplexer"
  homepage "https://github.com/0x1b2c/wezterm"

  conflicts_with cask: [
    "wezterm",
    "wezterm@nightly",
  ]
  depends_on :macos

  app "WezTerm.app"
  binary "#{appdir}/WezTerm.app/Contents/MacOS/wezterm"
  binary "#{appdir}/WezTerm.app/Contents/MacOS/wezterm-gui"
  binary "#{appdir}/WezTerm.app/Contents/MacOS/wezterm-mux-server"
  binary "#{appdir}/WezTerm.app/Contents/MacOS/strip-ansi-escapes"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/WezTerm.app"]
  end

  zap trash: [
    "~/Library/Caches/org.1b2c.wezterm",
    "~/Library/Preferences/org.1b2c.wezterm.plist",
    "~/Library/Saved Application State/org.1b2c.wezterm.savedState",
  ]
end
