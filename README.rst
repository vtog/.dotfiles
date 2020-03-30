Setup .dotfiles
===============

.. note:: This assumes my "dotfiles" repo exists.


#. Setup

   .. code-block:: bash

      git clone --separate-git-dir=$HOME/.dotfiles git@github.com:vtog/.dotfiles.git tmpdotfiles
      rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
      rm -rf tmpdotfiles
      source .zshrc
      dotfiles config --local status.showUntrackedFiles no

#. Install SpaceShip Prompt (Arch Linux)

   .. code-block:: bash

      git clone https://aur.archlinux.org/spaceship-prompt-git.git
      cd spaceship-prompt-git
      makepkg -si

#. Install vim-plug (neovim)

   .. code-block:: bash

      curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


