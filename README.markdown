puppet-sudo
===========

A puppet module that constructs and verifies sudoers

Requires R.I. Pienaar's concat module.

Usage:
------
<pre>

 class { 'sudo':; }

   sudo::useralias {
     'ADMINS':
       list => [ hiera_array('admins') ];
   }

   sudo::userspec {
     'ADMINS':
       cmnd_spec_list =>  ['(ALL) ALL', 'NOPASSWD: /usr/sbin/service', 'NOPASSWD: /usr/bin/puppet agent -t'];
   }
</pre>