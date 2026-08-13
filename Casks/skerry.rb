cask "skerry" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.7"
  sha256 arm:   "5f8e4763cccde905456e60282504bdca6c6205a115a218f8946a8a639a753984",
         intel: "90fa0cdb3fda6d421c0bd701440db2c2e750618a2ae83f1034663e1bf05e070a"

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
