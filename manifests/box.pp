# Public: Manages vagrant boxes
#
# Usage:
#
#   vagrant::box { 'precise64/vmware_fusion':
#     source   => 'http://files.vagrantup.com/precise64_vmware_fusion.box'
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
