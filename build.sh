for conf in /etc/yum.repos.d/*
    do sed -i 's/metalink/#metalink/' $conf
    sed -i 's/#baseurl=http:\/\/download.fedoraproject.org\/pub\/fedora\/linux/baseurl=https:\/\/mirrors.kernel.org\/fedora/' $conf
done
microdnf update --nodocs && microdnf install --nodocs autoconf automake binutils bison flex gcc gcc-c++ gdb glibc-devel libtool make pkgconfig strace git python libX11-devel libxkbfile-devel libsecret-devel
# dnf upgrade -y --nodocs && dnf install -y --nodocs @c-development git libX11-devel libxkbfile-devel libsecret-devel
useradd -u $(( ( RANDOM % 10 )  + 70000 )) -U user
su - user
git clone --depth 1 https://github.com/creationix/nvm.git ~/.nvm
source ~/.nvm/nvm.sh
nvm install 7.9.0
nvm use 7.9.0
npm config set python $(type -p python)
npm install -g gulp
# git clone -b '1.16.1' --single-branch --depth 1 https://github.com/Microsoft/vscode
git clone --recursive -b '1.16.1' --single-branch --depth 1 https://github.com/Microsoft/vscode
# git clone --recursive https://github.com/Microsoft/vscode
cd vscode
# git submodule update --recursive
# git checkout tags/1.16.1
./scripts/npm.sh install
gulp vscode-linux-arm-min
