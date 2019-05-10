Facter.add(:perfsonar_version) do
  confine :osfamily => 'RedHat'
  setcode do
    perfsonar = Facter::Util::Resolution::exec('/bin/rpm -q --qf "%{NAME} %{VERSION}\n" perfsonar-toolkit | grep "^perfsonar-toolkit "')
    perfsonar.split(/ /)[1] if perfsonar
  end
end

Facter.add(:perfsonar_version) do
  confine :osfamily => 'Debian'
  setcode do
    perfsonar = Facter::Util::Resolution::exec('/usr/bin/dpkg -s perfsonar-toolkit|grep Version|cut -d \':\' -f2|awk \'{print $1}\'')
    perfsonar.split(/ /)[1] if perfsonar
  end
end
