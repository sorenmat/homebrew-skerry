cask "skerry" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.8"
  sha256 arm:   "8972b2d2d5217ce9b80fb6b511375c824ce1dcb9cdb85a0573adb4db2657cc0b",
         intel: "d6685ddd6c81a169bfaa8bab708e1c856eaa1d1b980d8cf7a332adaa25282acf"

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
