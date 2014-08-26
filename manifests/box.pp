# Public: Manages vagrant boxes
#
# Usage:
#
#   vagrant::box { 'ubuntu-14.04':
#     source   => 'puppetlabs/ubuntu-14.04-64-puppet'
#   }

define vagrant::box(
  $source,
  $vprovider = '',
  $ensure = 'present',
) {
  require vagrant

  if ( $vprovider == undef ) or ( $vprovider == '' ) {
    $vprov = $vagrant::default_vprovider
  } else {
    $vprov = $vprovider
  }
  
  vagrant_box { $name:
    ensure   => $ensure,
    source   => $source,
    vprovider => $vprov,
  }
}
