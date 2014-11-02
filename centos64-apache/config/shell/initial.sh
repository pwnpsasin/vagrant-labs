
ARCHM=$(/bin/bash "/vagrant/config/shell/os-detect.sh" ARCHM)

cat /vagrant/config/shell/info.txt


sudo yum -y update

[ -f /usr/bin/mc ] || yum install -y mc
[ -f /bin/nano ] || yum install -y nano

yum -y remove subversion


[ -f /usr/bin/git ] || yum install -y git git-svn


rpm -qa | egrep -qw cyrus-sasl-plain || yum install -y cyrus-sasl-plain cyrus-sasl-md5 cyrus-sasl-gssapi cyrus-sasl-ntlm

[ -f /usr/sbin/httpd ] || yum install -y httpd httpd-devel libxml2-devel libXpm-devel gmp-devel libicu-devel t1lib-devel aspell-devel openssl-devel bzip2-devel libcurl-devel libjpeg-devel libvpx-devel libpng-devel freetype-devel readline-devel libtidy-devel libxslt-devel


[ -f /usr/bin/lynx ] || yum install -y lynx


yum grouplist 'Development Tools' | egrep -qw "Installed" || yum -y groupinstall 'Development Tools' 

[ -f /usr/bin/php ] || yum install -y php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml php-soap

[ -d /etc/httpd ] && tar -cf /etc/httpd.orig.tar /etc/httpd > /dev/null 2>&1 && rm -R /etc/httpd

[ -d /etc/httpd ] || cd /etc && tar -xf /vagrant/my-httpd.tar > /dev/null 2>&1

[ -f /usr/bin/composer ] || /vagrant/config/shell/curl-composer.sh
 

[ -f /etc/php.ini ] && tar -cf /etc/php.ini.orig.tar /etc/php.ini > /dev/null 2>&1 && cat /vagrant/etc/php.ini > /etc/php.ini
[ -f /etc/init/http_restart.conf ] || cat /vagrant/etc/init/http_restart.conf > /etc/init/http_restart.conf


rpm -qa | egrep -qw libevent-devel || yum install -y libevent-devel
rpm -qa | egrep -qw memcached || yum install -y memcached
rpm -qa | egrep -qw libmemcached || yum install -y libmemcached
rpm -qa | egrep -qw libmemcached-devel || yum install -y libmemcached-devel

        if [ "${ARCHM}" == 'i686' ]; then
               [ -f /usr/bin/svn ] || yum install -y /vagrant/pack/rpms/serf-1.3.4-1.i686.rpm /vagrant/pack/rpms/subversion-1.8.9-1.i686.rpm
               [ -f /usr/bin/puppet ] || rpm -ivh http://yum.puppetlabs.com/el/6.4/products/i386/puppetlabs-release-6-7.noarch.rpm
               [ -f /usr/bin/puppet ] || yum install -y puppet-server
               [ -f /usr/bin/puppet ] || sudo /etc/init.d/puppetmaster restart
               [ -L /etc/httpd/modules ] || ln -s /usr/lib/httpd/modules /etc/httpd/modules
        fi

        if [ "${ARCHM}" == 'x86_64' ]; then
               [ -f /usr/bin/svn ] || yum install -y /vagrant/pack/rpms/serf-1.3.4-1.x86_64.rpm /vagrant/pack/rpms/subversion-1.8.9-1.x86_64.rpm
               [ -f /usr/bin/puppet ] || rpm -ivh http://yum.puppetlabs.com/el/6.4/products/x86_64/puppetlabs-release-6-7.noarch.rpm
               [ -f /usr/bin/puppet ] || yum install -y puppet-server
               [ -f /usr/bin/puppet ] || sudo /etc/init.d/puppetmaster restart
               [ -L /etc/httpd/modules ] || ln -s /usr/lib64/httpd/modules /etc/httpd/modules
        fi

        if [ "${ARCHM}" == 'i686' ]; then
           [ -f /usr/lib/php/modules/memcached.so ] || /vagrant/config/shell/memcached-install.sh
        fi

        if [ "${ARCHM}" == 'x86_64' ]; then
           [ -f /usr/lib64/php/modules/memcached.so ] || /vagrant/config/shell/memcached-install.sh
        fi


[ -f /usr/bin/nmap ] || yum install -y nmap
[ -f /usr/bin/telnet ] || yum install -y telnet
[ -f /usr/bin/nc ] || yum install -y nc


#[ -f /usr/local/bin/memcached ] || cd /tmp && wget http://memcached.googlecode.com/files/memcached-1.4.3.tar.gz && tar xvzf memcached-1.4.3.tar.gz && cd /tmp/memcached-1.4.3 && ./configure --enable-sasl && make && make test && sudo make install










