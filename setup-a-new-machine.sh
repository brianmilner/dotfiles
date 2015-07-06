# copy paste this file in bit by bit.
# don't run it.
  echo "do not run this script in one go. hit ctrl-c NOW"
  read -n 1


##
##  migration from old machine
##
##    grab the good stuff.
##


mkdir -p ~/migration/home
cd ~/migration


# what is worth reinstalling
brew leaves      		> brew-list.txt    # all top-level brew installs
brew cask list 			> cask-list.txt
npm list -g --depth=0 	> npm-g-list.txt


# then compare brew-list to what's in `brew.sh`
#   comm <(sort brew-list.txt) <(sort brew.sh-cleaned-up)

# let's hold on to these

cp ~/.extra ~/migration/home
cp ~/.z ~/migration/home

cp -R ~/.ssh ~/migration/home
cp -R ~/.gnupg ~/migration/home

cp /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist ~/migration  # wifi

cp ~/Library/Preferences/net.limechat.LimeChat.plist ~/migration

cp -R ~/Library/Services ~/migration # automator stuff

cp -R ~/Documents ~/migration

cp ~/.bash_history ~/migration # back it up for fun?

# Timestats chrome extension stats
#   chrome-extension://ejifodhjoeeenihgfpjijjmpomaphmah/options.html#_options
# 	gotta export into JSON through devtools:
#     copy(JSON.stringify(localStorage, null, '  '))
#     pbpaste > timestats-canary.json.txt


# Current Chrome tabs via OneTab

# iTerm settings.
	# Prefs, General, Use settings from Folder

# Finder settings and TotalFinder settings
	# Not sure how to do this yet. Really want to.




##
## new machine setup.
##


#
# homebrew!
#
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#export PATH=$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$PATH // ?? Do I need to do this on my machine ??
#
# install all the things // I don't have this set up yet. I need to create my own custom files
#./brew.sh
#./brew-cask.sh


# Zsh/Oh-My-ZSH
curl -L http://install.ohmyz.sh | sh
# // Need to configure the .zschrc file to set up preferences and install plugins


# Grunt :: Install Grunt globally
npm install -g grunt-cli


# github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)


# Type `git open` to open the GitHub page or website for a repository.
npm install -g git-open


# github.com/rupa/z   - oh how i love you
git clone https://github.com/rupa/z.git ~/code/z
chmod +x ~/code/z/z.sh
# consider reusing your current .z file if possible. it's painful to rebuild :)
# z hooked up in .bash_profile


# github.com/thebitguru/play-button-itunes-patch
# disable itunes opening on media keys
git clone https://github.com/thebitguru/play-button-itunes-patch ~/code/play-button-itunes-patch


# my magic photobooth symlink -> dropbox. I love it.
#  + first move Photo Booth folder out of Pictures
#  + then start Photo Booth. It'll ask where to put the library.
#  + put it in Dropbox/public
# * Now… you can record photobooth videos quickly and they upload to dropbox DURING RECORDING
# * then you grab public URL and send off your video message in a heartbeat.


# for the c alias (syntax highlighted cat) // Dont think that I need this
# sudo easy_install Pygments


# change to bash 4 (installed by homebrew) 
# // tried to insall this and didn't make it past the first line and then I got a message: 
# zsh: permission denied: /etc/shells -- I didn't want to change permissions right now on this file
#BASHPATH=$(brew --prefix)/bin/bash
#sudo echo $BASHPATH >> /etc/shells
#chsh -s $BASHPATH # will set for current user only.
#echo $BASH_VERSION # should be 4.x not the old 3.2.X
# Later, confirm iterm settings aren't conflicting.


# iterm with more margin! http://hackr.it/articles/prettier-gutter-in-iterm-2/

# software licenses like sublimetext

# setting up the sublime symlink // Did mine a little differently :: see link
# http://olivierlacan.com/posts/launch-sublime-text-3-from-the-command-line/
ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/usr/local/bin/sublime


# go read mathias, paulmillr, gf3, alraa's dotfiles to see what to update with.


# set up osx defaults
# 	maybe something else in here https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh
sh .osx


# symlinks!
#   put/move git credentials into ~/.gitconfig.local 
#   https://help.github.com/articles/caching-your-github-password-in-git/
#   http://stackoverflow.com/a/13615531/89484
./symlink-setup.sh