cask "skerry" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.6"
  sha256 arm:   "7bd9c54795e7ffd96a2a7a62750da6d118b8ef73830a55a5cb16a64ea315d330",
         intel: "67e2d93588ca85161cc0fbd917f2296d0d2293ead7299c948d0d236d0da9eba1"

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
