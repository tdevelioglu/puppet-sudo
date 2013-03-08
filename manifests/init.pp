# == Class: sudo
#
# This module manages sudo
#
# === Parameters
#
# None
#
# === Examples
#
# class { 'sudo':; }
#
#   sudo::useralias {
#     'ADMINS':
#       list => [ hiera_array('admins') ];
#   }
#
#   sudo::userspec {
#     'ADMINS':
#       cmnd_spec_list =>  ['(ALL) ALL', 'NOPASSWD: /usr/sbin/service', 'NOPASSWD: /usr/bin/puppet agent -t'];
#   }
#
# === Resources
#
# * man sudoers
#
# === Authors
#
# * Taylan Develioglu <tdevelioglu@ebuddy.com>
#
class sudo {
  package { 'sudo': ensure => present; }

  concat { '/var/tmp/sudoers.puppet':
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    notify  => Exec['Install sudoers'];
  }

  concat::fragment {
    'sudoers_header':
      target  => '/var/tmp/sudoers.puppet',
      order   => '000',
      content => template('sudo/etc/sudoers/header.erb');
    'sudoers_hostalias_header':
      target  => '/var/tmp/sudoers.puppet',
      order   => '010',
      content => "\n# Host alias specification\n";
    'sudoers_useralias_header':
      target  => '/var/tmp/sudoers.puppet',
      order   => '020',
      content => "\n# User alias specification\n";
    'sudoers_cmndalias_header':
      target  => '/var/tmp/sudoers.puppet',
      order   => '030',
      content => "\n# Cmnd alias specification\n";
    'sudoers_runalias_header':
      target  => '/var/tmp/sudoers.puppet',
      order   => '040',
      content => "\n# Runas alias specification\n";
    'sudoers_userspec_header':
      target  => '/var/tmp/sudoers.puppet',
      order   => '050',
      content => "\n# User privilege specification\n";
    'sudoers_footer':
      target  => '/var/tmp/sudoers.puppet',
      order   => '999',
      content => template('sudo/etc/sudoers/footer.erb');
  }

  exec { 'Install sudoers':
    command     => '/bin/mv /var/tmp/sudoers.puppet /etc/sudoers',
    onlyif      => '/usr/sbin/visudo -c -f /var/tmp/sudoers.puppet',
    refreshonly => true;
  }
}
