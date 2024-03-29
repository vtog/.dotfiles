Setup .dotfiles
===============

.. note:: This reference's my "dotfiles" repo. I'm using **"dots"** as an alias for **"git"**
   to manage the .dotfiles. This was added to .zshenv.

#. Setup

   .. code-block:: bash

      git clone --separate-git-dir=$HOME/.dotfiles git@github.com:vtog/.dotfiles.git tmpdotfiles
      rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
      rm -rf tmpdotfiles
      source .zshrc
      dots config --local status.showUntrackedFiles no

#. Install SpaceShip Prompt (RHEL)

   .. code-block:: bash
   
      git clone https://github.com/spaceship-prompt/spaceship-prompt.git --depth=1
      sudo ln -sf ~/git/spaceship-prompt/spaceship.zsh /usr/local/share/zsh/site-functions/prompt_spaceship_setup

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
