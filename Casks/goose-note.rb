cask "goose-note" do
  arch arm: "-arm64", intel: ""

  version "9.0.1,e64d851"
  sha256 arm:   "b40e6352c8f6202e92793f1787cd4a93ed37ab6b51e13d62c79c62375c3266e9",
         intel: "12c846b1ed6d53278afa1ea7ce674ffbad25fff4a99d341ff816c6b247a63253"

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
