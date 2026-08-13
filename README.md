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
