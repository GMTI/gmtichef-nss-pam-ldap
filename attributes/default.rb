#
# Cookbook Name: nslcd
# Attributes: default

#
case node['platform_family']
when 'rhel', 'fedora'
  default['nslcd']['package'] = 'nss-pam-ldapd'
else
  default['nslcd']['package'] = 'nslcd'
end

# data bag configuraiton

default['nslcd']['data_bag'] = 'nslcd'
default['nslcd']['data_bag_name'] = 'nslcd'
# runtime options
default['nslcd']['threads'] = 5
# default['nslcd']['uid'] = 'nslcd'
# default['nslcd']['gid'] = 'ldap'
default['nslcd']['log'] = ''

# general connection options
default['nslcd']['uri'] = 'ldap://example.com'
default['nslcd']['ldap_version'] = ''
# default['nslcd']['binddn'] = 'DC=something,DC=here,DC=com'
# default['nslcd']['bindpw'] = 'bindpasswd'
# default['nslcd']['rootpwmoddn'] = ''
# default['nslcd']['rootpwmodpw'] = ''

# SASL authentication options
default['nslcd']['sasl']['enable'] = false
default['nslcd']['sasl']['mech'] = ''
default['nslcd']['sasl']['realm'] = ''
default['nslcd']['sasl']['authcid'] = ''
default['nslcd']['sasl']['authzid'] = ''
default['nslcd']['sasl']['secprops'] = ''
default['nslcd']['sasl']['canonicalize'] = ''

# Kerberos authentication options
default['nslcd']['krb5_ccname'] = ''

# search options
# default['nslcd']['base'] = 'DC=something,DC=here,DC=com'
default['nslcd']['scope'] = 'sub'
default['nslcd']['deref'] = 'never'
default['nslcd']['referrals'] = 'yes'

# Timing/reconnect options
default['nslcd']['bind_timelimit'] = 10
default['nslcd']['timelimit'] = 0
default['nslcd']['idle_timelimit'] =
default['nslcd']['reconnect_sleeptime'] = 1
default['nslcd']['reconnect_retrytime'] = 10

# SSL/TLS Options
default['nslcd']['ssl'] = 'off'
default['nslcd']['tls_reqcert'] = 'never'
default['nslcd']['tls_cacertdir'] = '/etc/openldap/cacerts'
default['nslcd']['tls_cacertfile'] = ''
default['nslcd']['tls_randfile'] = ''
default['nslcd']['tls_ciphers'] = ''
default['nslcd']['tls_cert'] = ''
default['nslcd']['tls_key'] = ''

# Other Options
default['nslcd']['pagesize'] = 0
default['nslcd']['nss_initgroups_ignoreusers'] = 'root'
default['nslcd']['nss_min_uid'] = ''
default['nslcd']['nss_nested_groups'] = ''
default['nslcd']['validnames'] = ''
default['nslcd']['ignorecase'] = ''
default['nslcd']['pam_authz_search'] = ''
default['nslcd']['pam_password_prohibit_message'] = ''
default['nslcd']['reconnect_invalidate'] = ''
default['nslcd']['cache'] = ''

# Filters/Maps

default['nslcd']['filters'] = []
