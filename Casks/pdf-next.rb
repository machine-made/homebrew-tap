cask "pdf-next" do
  version "0.16.5"
  sha256 "4d8e9747837fb4622ee4ac605f9c183a909dacf3feeddf8972f5d16e642c0743"

  url "https://github.com/machine-made/pdf-next/releases/download/v#{version}/pdf-next_#{version}_universal.dmg"
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
