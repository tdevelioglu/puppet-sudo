# Define: sudo::hostalias
#
# This define manages sudo hostaliases
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
define sudo::hostalias(
  $list
  ) {
  concat::fragment { "hostalias_${name}":
    target  => '/var/tmp/sudoers.puppet',
    order   => '012',
    content => template('sudo/etc/sudoers/hostalias.erb');
  }
}
