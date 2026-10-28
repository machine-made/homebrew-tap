cask "pdf-next" do
  version "0.16.1"
  sha256 "6a968a29fde47ffab53faf923f43f2a35e6daf954121a9911ca4f9d412ffaf45"

  url "https://github.com/machine-made/pdf-next/releases/download/v#{version}/pdf-next_#{version}_universal.dmg",
      verified: "github.com/machine-made/pdf-next/"
  name "pdf-next"
  desc "PDF, image and markdown viewer that reloads when the file changes"
  homepage "https://github.com/machine-made/pdf-next"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "pdf-next.app"
  binary "#{appdir}/pdf-next.app/Contents/MacOS/pdf-next"

  zap trash: [
    "~/Library/Application Support/dev.frantz.pdf-next",
    "~/Library/Caches/dev.frantz.pdf-next",
    "~/Library/HTTPStorages/dev.frantz.pdf-next",
    "~/Library/Preferences/dev.frantz.pdf-next.plist",
    "~/Library/Saved Application State/dev.frantz.pdf-next.savedState",
    "~/Library/WebKit/dev.frantz.pdf-next",
  ]

  caveats <<~EOS
    pdf-next is not signed or notarized yet, so macOS quarantines it and the
    first launch is refused. Let this copy through once:

      xattr -dr com.apple.quarantine "#{appdir}/pdf-next.app"

    Repeat it after an upgrade, which installs a fresh copy.
  EOS
end
