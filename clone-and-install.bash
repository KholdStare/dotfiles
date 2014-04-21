set -e
set -u

cd ${HOME}
git clone git://github.com/KholdStare/dotfiles.git
cd dotfiles
./force.bash
