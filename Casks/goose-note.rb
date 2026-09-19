cask "goose-note" do
  arch arm: "-arm64", intel: ""

  version "9.8.7,90bb63a"
  sha256 arm:   "ba538c0b86cba1fe1fe28eb0932acbbe2a27670eb3957f0dc6c7b91fc4aa4114",
         intel: "282c0abf1c50637531b4691fa244ffc9fd9e5d7ea4b5c0596aefd3519ff6db73"

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
