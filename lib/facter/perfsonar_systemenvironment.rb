Facter.add(:perfsonar_systemenvironment) do
  confine :osfamily => 'RedHat'
  setcode do
    ps_se = Facter::Util::Resolution::exec('/bin/rpm -q --qf "%{NAME}\n" perfsonar-toolkit-systemenv | grep "^perfsonar-toolkit-systemenv$"')
    ps_se && !ps_se.empty? ? true : false
  end
end
Facter.add(:perfsonar_systemenvironment) do
  confine :osfamily => 'Debian'
  setcode do
    ps_se = Facter::Util::Resolution::exec('/usr/bin/dpkg -s perfsonar-toolkit-systemenv|grep Version|cut -d \':\' -f2|awk \'{print $1}\'')
    ps_se && !ps_se.empty? ? true : false
  end
end
