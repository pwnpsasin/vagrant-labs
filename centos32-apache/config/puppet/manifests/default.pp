####################################
### Default Paths
####################################
Exec
{
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}



#exec { "sudo yum update": path=> "/usr/bin", }

#package {"mc": ensure=>present, require=>Exec["sudo yum -y install mc"], }



host { 'devlibra':
    ip => '127.0.0.1',
        host_aliases => [ 'diagno.devellibra', 
                          'www.devellibra', 
                          'devellibra.ibuk.pl', 
                          'www.devellibra.ibuk.pl', 
                          'staginglibra',
                          'www.staginglibra',
                          'staginglibra.ibuk.pl', 
                          'www.staginglibra.ibuk.pl', 
                          'productionlibra', 
                          'www.productionlibra',
                          'productionlibra.ibuk.pl',
                          'www.productionlibra.ibuk.pl' ],
        }
        
# wlaczyc i uruchomic sshd
service { 'sshd':
  enable => 'true',
  ensure => "running",
}

# wylaczyc w systemie i z pamieci iptables
service { 'iptables':
  enable => 'false',
  ensure => "stopped",
}



file { "/vagrant/project/web00":
    ensure => "directory",
}



file { "/vagrant/log/":
    ensure => "directory",
    recurse => true,
    mode    => 0777,
}

file { "/vagrant/log/httpd":
    ensure => "directory",
    require => File['/vagrant/log'],
    owner  => "root",
    mode    => 0777,
}

file { "/vagrant/log/httpd/devellibra_access.log":
    ensure  => "present",
    mode    => 644,
    require => File['/vagrant/log/httpd'],
}

file { "/vagrant/log/httpd/devellibra.log":
    ensure  => "present",
    mode    => 644,
    require => File['/vagrant/log/httpd'],
}

file { "/vagrant/log/httpd/staginglibra_access.log":
    ensure  => "present",
    mode    => 644,
    require => File['/vagrant/log/httpd'],
}

file { "/vagrant/log/httpd/staginglibra.log":
    ensure  => "present",
    mode    => 644,
    require => File['/vagrant/log/httpd'],
}

file { "/vagrant/log/httpd/productionlibra_access.log":
    ensure  => "present",
    mode    => 644,
    require => File['/vagrant/log/httpd'],
}

file { "/vagrant/log/httpd/productionlibra.log":
    ensure  => "present",
    mode    => 644,
    require => File['/vagrant/log/httpd'],

}

file { "/vagrant/log/httpd/diagno.devellibra_access.log":
    ensure  => "present",
    mode    => 644,
    require => File['/vagrant/log/httpd'],

}

file { "/vagrant/log/httpd/diagno.devellibra.log":
    ensure  => "present",
    mode    => 644,
    require => File['/vagrant/log/httpd'],

}

file { "/vagrant/http-diagno":
    ensure => "directory",
}


user { 'root':
  ensure           => 'present',
  comment          => 'root',
  gid              => '0',
  home             => '/root',
  password         => '$1$1PBRCvEv$k1zSzdy8P0MIvLMF1xDCl.',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '0',
}



# wlaczyc i uruchomic memcached
service { 'memcached':
  enable => 'true',
  ensure => "running",
}


# wlaczyc httpd w konfigu i jako serwis

service { 'httpd':
  enable => 'true',
}
