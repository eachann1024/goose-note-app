cask "goose-note" do
  arch arm: "-arm64", intel: ""

  version "9.8.6,aff201c"
  sha256 arm:   "8ca8234094cc7714c02794f2d5298f15aad9d9224816741d58df0f59813180a1",
         intel: "6dea6ea47514d9c78252c9d2b6bacec6b598b10ee099e493fa95155c95e64197"

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
