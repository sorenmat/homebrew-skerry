# Homebrew Skerry

Homebrew tap for [Skerry](https://github.com/sorenmat/skerry), a dual-frontend
text editor for macOS and Linux.

On macOS:

```sh
brew tap sorenmat/skerry
brew install --cask skerry
```

The cask installs `Skerry.app`, exposes its GUI executable as `sky`, and
installs the terminal frontend as `skerry-tui`.

On x86_64 Linux:

```sh
brew tap sorenmat/skerry
brew install skerry
```

The formula installs the GUI as `skerry`, exposes it as `sky`, and installs
the terminal frontend as `skerry-tui`.

## Gatekeeper quarantine (macOS)

Skerry's release builds are ad-hoc signed and not Apple-notarized, so macOS
quarantines each fresh install or upgrade and may block the first launch.
If you accept that, let Homebrew strip the flag on every install:

```sh
echo 'export HOMEBREW_CASK_OPTS="--no-quarantine"' >> ~/.zshrc
```

Note this disables quarantine for every cask you install, not just Skerry.
Alternatives — including a per-user LaunchAgent that watches only Skerry.app —
are documented in [Skerry's install guide](https://github.com/sorenmat/skerry/blob/master/INSTALL.md#avoiding-the-quarantine-dance-on-every-upgrade).
