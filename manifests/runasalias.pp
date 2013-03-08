# Define: sudo::runasalias
#
# This define manages sudo runasaliases
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
define sudo::runasalias(
  $list
  ) {
  concat::fragment { "runasalias_${name}":
    target  => '/var/tmp/sudoers.puppet',
    order   => '042',
    content => template('sudo/etc/sudoers/runasalias.erb');
  }
}
