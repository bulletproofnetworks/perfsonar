class perfsonar::install (
  $ensure = $::perfsonar::params::install_ensure,
) inherits perfsonar::params {
  notify{"1: ${::perfsonar::params::install_ensure}": }
  notify{"2: ${::perfsonar::params::install_packages}": }
  if $::osfamily == 'Debian' {
    apt::key { 'perfsonar-key':
      ensure =>  'present',
      id     =>  '5A507954F531B92300DA2068351ED8279AFA4E0A',
      source =>  'http://downloads.perfsonar.net/debian/perfsonar-release.gpg.key',
    }
    -> apt::source { 'downloads.perfsonar.net':
      architecture =>  'amd64',
      repos        =>  'main',
      location     =>  "http://downloads.perfsonar.net/debian/ perfsonar-release",
      notify       =>  Exec['apt_update'],
    }
  }
  else {
    package { $::perfsonar::params::install_packages:
      ensure => $ensure,
    }
  }
}
