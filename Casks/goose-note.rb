cask "goose-note" do
  arch arm: "-arm64", intel: ""

  version "9.8.10,d8cac4d"
  sha256 arm:   "6e2dd687be485611bbe3e2cc3b6ae9ed0de82d67a5c1e179d3d20dbc36f7d2e3",
         intel: "1dd6ebf0b8b0d5c5455dc6db76a33ef0ce6c425cd026a9ad2a465bbdc42e7b63"

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
