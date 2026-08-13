cask "skerry" do
  arch arm: "arm64", intel: "x86_64"

  version :latest
  sha256 :no_check

  url "https://github.com/sorenmat/skerry/releases/latest/download/Skerry-macos-#{arch}.tar.gz"
  name "Skerry"
  desc "Dual-frontend text editor for mixed-size workloads"
  homepage "https://github.com/sorenmat/skerry"

  depends_on macos: :big_sur

  app "Skerry.app"
  binary "#{appdir}/Skerry.app/Contents/Resources/skerry", target: "sky"

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
