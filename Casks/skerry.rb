cask "skerry" do
  version "0.1.10"

  # Resolve the architecture in plain Ruby instead of `arch arm:/intel:` and
  # `sha256 arm:/intel:`: those OnSystem conditions evaluate to nil when
  # Homebrew loads the cask on Linux (any `brew install/upgrade skerry`
  # there probes the cask first), which makes the whole definition invalid.
  arm = Hardware::CPU.arm?
  arch_name = arm ? "arm64" : "x86_64"
  sha256(arm ? "a1d3a224527bfe8e3f823a8e293b2a0c81482fcd6c87bd4b4d7416f422444239"
             : "261f5ccbea624692eb5c44017cdb2d0eb9a2ea5abc4f5036a4fba91905406a76")

  url "https://github.com/sorenmat/skerry/releases/download/v#{version}/Skerry-macos-#{arch_name}.tar.gz"
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
