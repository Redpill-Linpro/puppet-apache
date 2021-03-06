# Class apache::passenger
#
# Apache resources specific for passenger
#
class apache::passenger {

  include apache

  case $::operatingsystem {
    ubuntu,debian,mint: {
      package { 'libapache2-mod-passenger':
        ensure => present;
      }

      exec { 'enable-passenger':
        command => '/usr/sbin/a2enmod passenger',
        creates => '/etc/apache2/mods-enabled/passenger.load',
        notify  => Service['apache'],
      }
    }

    centos,redhat,scientific,fedora: {
      package { 'mod_passenger':
        ensure => present;
      }
    }

    default: { }
  }

}
