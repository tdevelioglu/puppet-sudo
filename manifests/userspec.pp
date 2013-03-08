# Define: sudo::userspec
#
# This define manages sudo userspecs
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
define sudo::userspec(
  $host_list       = ['ALL'],
  $cmnd_spec_list
  ) {
  concat::fragment { "userspec_${name}":
    target  => '/var/tmp/sudoers.puppet',
    order   => '052',
    content => template('sudo/etc/sudoers/userspec.erb');
  }
}
