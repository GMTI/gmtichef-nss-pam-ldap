name 'nss-pam-ldapd'
maintainer 'Daniel Washko'
maintainer_email 'dwashko@gmti.gannett.com'
license 'Apache 2.0'
description 'Installs and configures nslcd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

recipe 'nslcd', 'Installs and configures nslcd.conf'

supports 'centos'
supports 'redhat'
