PREFIX=/home/vagrant
BINDIR="$PREFIX/bin"

mkdir $BINDIR

# Install matcher
TEMP_MATCHER_FOLDER=`mktemp -d`
git clone git@github.com:burke/matcher.git $TEMP_MATCHER_FOLDER \
  && cd $TEMP_MATCHER_FOLDER \
  && make install PREFIX=$PREFIX \

# Install hub
HUBDIR="$BINDIR/hub"
TEMP_HUB_FOLDER=`mktemp -d`
git clone https://github.com/github/hub.git $TEMP_HUB_FOLDER \
  && cd $TEMP_HUB_FOLDER \
  && rake install prefix=$PREFIX \

# Setup dotfiles
DOTFILES_FOLDER="$PREFIX/dotfiles"
[ -d $DOTFILES_FOLDER ] && rm -rf $DOTFILES_FOLDER
[ -f "$PREFIX/.bashrc" ] && rm "$PREFIX/.bashrc"

git clone git@github.com:cjoudrey/dotfiles.git $DOTFILES_FOLDER \
  && cd $DOTFILES_FOLDER \
  && rake install \
  && rm "$PREFIX/.bash_profile" \

# Reload profile
. "$PREFIX/.profile"
