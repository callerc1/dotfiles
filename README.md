# Chris ❤️🧡💛💚💙💜 ~/

Dotfiles are all those files beginning with a "." in your user directory and make your system (particularly anything to do with the command line) work and look the way you want it.

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/.dotfiles`).

The installation step requires the [XCode Command Line Tools](https://developer.apple.com/downloads), although you _should_ be prompted to install these if you don't have them installed already.

```sh
git clone https://github.com/callerc1/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

### Bootstrap and Backups

The bootstrap script will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

Fair warning: The bootstrap script _attempts_ to backup existing dotfiles in your HOME directory, but to be safe you should probably make your own copy...

`dot` installs some dependencies, sets sane OS X defaults, and so on.
Tweak this script, and occasionally run `dot` from time to time to keep
your environment fresh and up-to-date. You can find this script in `bin/`.

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/callerc1/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md}
script/bootstrap
```

### Install

```bash
  script/install
```

## Topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## Thanks

Largely based off @holman's awesome repo, but also with some
help/ideas/blatent pilfering from these fantastic people:

- [@holman](https://github.com/holman/dotfiles)
- [@mathiasbyens](https://github.com/mathiasbynens/dotfiles)
- [@paulirish](https://github.com/paulirish/dotfiles)
