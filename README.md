### Customizable Helper scripts to get things moving along a bit faster.

Intuitive and customizable scripts to help reinstall applications after a fresh install.

#### Usage:

---

* in macOS
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/edisonslightbulbs/bootstrap/master/online/macOS/install.command)"
```

* in Ubuntu 
```
# install git
sudo apt-get install git -y

# -- clone repo
git clone https://github.com/edisonslightbulbs/bootstrap.git

# -- run the install script
cd bootstrap/offline/Ubuntu
./install.sh
```
Here are a couple of custom options
```
# -- font script (optional)
./font.sh # fira-code-nerd-font

# -- tilix config (optional)
cd resources/tilix
./configure.sh # personal tilix config file

# -- installing exa (optional)
cd resources/exa # exa is a git submodule (you may need to initialize it if empty)
sudo make install
```

---

#### Screen cast

`Comming soon!`

#### Handy?

[ star ](https://github.com/edisonslightbulbs/bootstrap/star) if it came handy.

[ fork ](https://github.com/edisonslightbulbs/bootstrap/fork) if you liked.

[ follow ](https://github.com/edisonslightbulbs/bootstrap/subscription) if you loved.

###### DISCLAIMER: 
###### Any utility provided by this repository is for informative/educational purposes and also, subject to experimental changes.

