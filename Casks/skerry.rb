cask "skerry" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.9"
  sha256 arm:   "fe723bbd1dc5deeece6c1fe1a5ffa3790545ae7892badf74ceb13c36a0b1fdea",
         intel: "61e0f1c59fd156503612b5d5d62a4dd6766b03dcca3ab273e94957d4e3e30eb0"

  url "https://github.com/sorenmat/skerry/releases/download/v#{version}/Skerry-macos-#{arch}.tar.gz"
  name "Skerry"
  desc "Dual-frontend text editor for mixed-size workloads"
  homepage "https://github.com/sorenmat/skerry"

  depends_on macos: :big_sur

  app "Skerry.app"
  binary "#{appdir}/Skerry.app/Contents/Resources/skerry", target: "sky"
  binary "#{appdir}/Skerry.app/Contents/Resources/skerry-tui"

  uninstall quit: "com.smo.skerry"

  caveats <<~EOS
    Skerry is ad-hoc signed and not Apple-notarized, so macOS may block it.
    After deciding to trust this installed copy, remove its quarantine and open it:

      xattr -dr com.apple.quarantine "#{appdir}/Skerry.app"
      open "#{appdir}/Skerry.app"

    This removes quarantine only from the current installation. A later upgrade
    may require the same explicit trust decision again.
  EOS
end
