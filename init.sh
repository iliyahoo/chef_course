# install some pkgs
packs="bash-completion vim mlocate wget net-tools nmap"
rpm_packs="$packs bind-utils"
deb_packs="$packs dnsutils"

# disable SElinux
if [[ $(grep 'DISTRIB_ID' /etc/*-release | sed 's/.*=//') == "Ubuntu" ]]; then
  apt-get purge apparmor
  service apparmor stop
  apt-get -y install $deb_packs
else
  sed -i 's/^\(SELINUX=\).*/\1disabled/' /etc/selinux/config
  setenforce 0 | true
  yum install -y $rpm_packs
fi
