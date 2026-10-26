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

This tap used to be `ricardofrantz/tap`. If you installed pdf-next from it,
move to the new tap:

```sh
brew tap machine-made/tap
brew reinstall --cask machine-made/tap/pdf-next
brew untap ricardofrantz/tap
```

Until you do, installs keep updating through GitHub's redirect.

Do not add `--force` to the last command. `brew untap --force` uninstalls every
cask from the tap before it removes the tap. Without `--force`, `brew untap`
lists the installed casks and asks first. If it lists pdf-next, answer no.

## What is here

- **[pdf-next](https://github.com/machine-made/pdf-next)** — a small PDF,
  image and markdown viewer that reloads the document within a second of the
  file changing on disk. Built for the LaTeX and Typst compile loop.

The casks follow the upstream releases; a workflow in this repository checks
once a day and commits the version bump itself.
