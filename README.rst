Setup .dotfiles
===============

.. note:: This reference's my "dotfiles" repo. I'm also using an alias to manage the .dotfiles, **"dots"**, replace "git"
   with this when managing the repo.

#. Setup

   .. code-block:: bash

      git clone --separate-git-dir=$HOME/.dotfiles git@github.com:vtog/.dotfiles.git tmpdotfiles
      rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
      rm -rf tmpdotfiles
      source .zshrc
      dots config --local status.showUntrackedFiles no

#. Install SpaceShip Prompt (Arch Linux)

   .. code-block:: bash

      git clone https://aur.archlinux.org/spaceship-prompt-git.git
      cd spaceship-prompt-git
      makepkg -si

#. Install vim-plug (neovim)

   .. code-block:: bash

      curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


#. Start VIM and Install/Update plug-ins

   .. code-block:: bash

      vim
      : PlugInstall
      : q
      : q
