# apt-based aliases
alias agi="sudo apt-get install" # install
alias agu="sudo apt-get upgrade" # update package list
alias agup="sudo apt-get update" # update packages
alias acs="apt-cache search" # search
alias aar="sudo add-apt-repository" # add a PPA

# pacman-based aliases
alias pcs="pacaur -S" # install
alias pcss="pacaur -Ss" # search
alias pcsy="pacaur -Sy" # update package list; always follow by package update
                        # before installing new packages!
alias pcsyy="pacaur -Syy" # force update package list
alias pcsyu="pacaur -Syu" # update packages
alias pcsi="pacaur -Si" # show dependencies
alias pcu="pacaur -U" # install package from local binary tarball
alias pcqu="pacaur -Qu" # list which packages have updates available
alias pcq="pacuar -Q" # list installed local packages

# ssh-related aliases
alias sshnone="ssh -oNoneSwitch=yes -oNoneEnabled=yes"
alias scpnone="scp -oNoneSwitch=yes -oNoneEnabled=yes"
alias rsyncnone="rsync -e 'ssh -oNoneSwitch=yes -oNoneEnabled=yes'"

# miscellaneous
alias info="info --vi-keys"
