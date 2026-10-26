# machine-made/homebrew-tap

Homebrew packages for my own software.

```sh
brew install --cask machine-made/tap/pdf-next
xattr -dr com.apple.quarantine /Applications/pdf-next.app
```

The second line is needed while the app is unsigned: macOS quarantines
anything downloaded and refuses the first launch. Homebrew used to offer
`--no-quarantine` for this and removed it in 5.0, deliberately — it will not
help you past a Gatekeeper check any more. Run it again after an upgrade,
which installs a fresh copy.

Already have the app from the `.dmg`? Homebrew stops rather than overwrite
something it did not put there. Add `--adopt` to take over the copy that is
already in `/Applications`, or delete it first.

If Homebrew asks you to trust this tap before it will read the cask:

```sh
brew trust --cask machine-made/tap/pdf-next
```

## Moved

This tap used to be `ricardofrantz/tap`. Installs from it keep updating
through GitHub's redirect, so you do not have to do anything.

To switch to the new name, take the app out of the old tap first, then
install it from the new one:

```sh
brew uninstall --cask pdf-next
brew untap ricardofrantz/tap
brew install --cask machine-made/tap/pdf-next
```

Uninstalling the cask keeps your app settings. Do this in this order: if you
install from the new tap first, both taps hold a cask named `pdf-next`, and
`brew untap` then offers to remove the app you just installed.

## What is here

- **[pdf-next](https://github.com/machine-made/pdf-next)** — a small PDF,
  image and markdown viewer that reloads the document within a second of the
  file changing on disk. Built for the LaTeX and Typst compile loop.

The casks follow the upstream releases; a workflow in this repository checks
once a day and commits the version bump itself.
