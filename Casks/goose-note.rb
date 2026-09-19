cask "goose-note" do
  arch arm: "-arm64", intel: ""

  version "9.8.5,6b48c6c"
  sha256 arm:   "5c8d5c12d9a1eb3cd7812152f880bc8354328bc0531190e3cb3087fafc4087a7",
         intel: "b3c2a548acc256fc1492e3ddfe37fc002a54299e9bbbb3f0f257b994259b902a"

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
