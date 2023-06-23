#execute apt-get update
exec { 'apt-update':
	command => '/usr/bin/apt-get update'
}

#install redis-server package
package { 'redis-server':
	require => Exec ['apt-update'],
	ensure => latest,
}

#run redis-server
service { 'redis-server':
	ensure => running,
	require => Package['redis-server'],
}

#create a directory
file { "home/vagrant/test-dir":
	ensure => "directory",
	owner => "vagrant",
	group => "vagrant",
	mode => 750
}