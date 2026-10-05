cask "wezterm-1b2c" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.0"
  # Placeholders until the first release is published; the release procedure
  # replaces them with the checksums of the two published zips.
  sha256 arm:   "0000000000000000000000000000000000000000000000000000000000000000",
         intel: "0000000000000000000000000000000000000000000000000000000000000001"

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
