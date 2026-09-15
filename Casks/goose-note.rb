cask "goose-note" do
  arch arm: "-arm64", intel: ""

  version "9.2.11,9bdf709"
  sha256 arm:   "234a2a9a71fdf81fc94b646fdc8378361c88e0f1d1dfc08611e4270301b2c807",
         intel: "e90243b6d80e8c0850fe91d436ae1d18bc0e59cf68e1cf6c78e2b4a2ab3d09f5"

  url "https://github.com/eachann1024/goose-note-app/releases/download/v#{version.csv.first}-#{version.csv.second}/Goose.Note-#{version.csv.first}#{arch}.dmg"
  name "Goose Note"
  desc "Local-first Markdown notes with AI"
  homepage "https://github.com/eachann1024/goose-note-app"
  depends_on :macos

  app "Goose Note.app"

  zap trash: [
    "~/Library/Application Support/Goose Note",
    "~/Library/Logs/Goose Note",
    "~/Library/Preferences/com.goosenote.desktop.plist",
    "~/Library/Saved Application State/com.goosenote.desktop.savedState",
  ]

  caveats <<~EOS
    Goose Note is currently unsigned and not notarized.
    After installing, macOS Gatekeeper may block it. Allow it in
    System Settings → Privacy & Security, or run:

      xattr -cr "/Applications/Goose Note.app"
  EOS
end
