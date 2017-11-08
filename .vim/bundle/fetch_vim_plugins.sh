# install pathogen
mkdir -p ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# fetch plugins
git clone https://github.com/elixir-editors/vim-elixir.git
git clone https://github.com/tpope/vim-sleuth.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/jistr/vim-nerdtree-tabs.git
git clone https://github.com/vim-scripts/Ambient-Color-Scheme.git
git clone https://github.com/slashmili/alchemist.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/airblade/vim-gitgutter.git
