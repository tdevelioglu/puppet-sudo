# Define: sudo::cmndalias
#
# This define manages sudo commandaliases
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
define sudo::cmndalias(
  $list
  ) {
  concat::fragment { "cmndalias_${name}":
    target  => '/var/tmp/sudoers.puppet',
    order   => '032',
    content => template('sudo/etc/sudoers/cmndalias.erb');
  }
}
