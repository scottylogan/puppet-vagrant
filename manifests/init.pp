# Public: Installs Vagrant 1.6.2
#
# Usage:
#
#   include vagrant

class vagrant($version = '1.6.2') {
  package { "Vagrant_${version}":
    ensure   => installed,
    source   => "https://dl.bintray.com/mitchellh/vagrant/vagrant_${version}.dmg",
    provider => 'pkgdmg'
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure => directory
  }
}
