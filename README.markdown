# sudo #

Manage sudoers (Debian)

=== Examples

 class { 'sudo':; }

   sudo::useralias {
     'ADMINS':
       list => [ hiera_array('admins') ];
   }

   sudo::userspec {
     'ADMINS':
       cmnd_spec_list =>  ['(ALL) ALL', 'NOPASSWD: /usr/sbin/service', 'NOPASSWD: /usr/bin/puppet agent -t'];
   }