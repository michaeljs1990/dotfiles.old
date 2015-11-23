# Setup

	git clone --recursive git@github.com:michaeljs1990/dotfiles.git

source the `autoload.sh` file in your `.bashrc` or `.bash_profile` and optionally run `init.sh`. All files in the `src` and `private` directory will be auto loaded every time you open your terminal.

#### src

All files that do not hold any private information and are applicable to a wider audience should be placed in here.

#### private

All credentials or files specific to your setup should be placed here.

#### libs

This should be used for git submodules or where it makes sense to hold a copy of an external repo.
