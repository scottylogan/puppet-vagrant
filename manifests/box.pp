# Public: Manages vagrant boxes
#
# Usage:
#
#   vagrant::box { 'ubuntu-14.04':
#     source   => 'puppetlabs/ubuntu-14.04-64-puppet'
#   }

define vagrant::box(
  $source,
  $ensure    = 'present',
  $vprovider = 'virtualbox',
) {
  require vagrant

  vagrant_box { $name:
    ensure    => $ensure,
    source    => $source,
    vprovider => $vprovider,
  }
}
