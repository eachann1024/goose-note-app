cask "goose-note" do
  arch arm: "-arm64", intel: ""

  version "9.7.6,a8284c4"
  sha256 arm:   "8df55309a9ca2cdce48709822f663ed65a16d25d26e044fe256e6ba8a5483b51",
         intel: "e239dfbca54538cedcfb84f19483c58e0ac1a40e13e0310cbac1bd2f8aaeb2d1"

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
