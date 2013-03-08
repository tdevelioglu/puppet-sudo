# Define: sudo::useralias
#
# This define manages sudo useraliases
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
define sudo::useralias(
  $list
  ) {
  concat::fragment { "useralias_${name}":
    target  => '/var/tmp/sudoers.puppet',
    order   => '022',
    content => template('sudo/etc/sudoers/useralias.erb');
  }
}
