nss-pam-ldap Cookbook
=====================

Description
-----------

The Chef `nss-pam-ldapd` cookbook installs the `nss-pam-ldapd` package and configures the `/etc/nslcd.conf` file.

Requirements
------------

The platform has a package named `nss-pam-ldapd` and the configuration file is `/etc/nslcd.conf`.

Attributes
----------

- `node['nslcd']['threads']` - specifies number of threads to start that can handle requests and perform LDAP queries (default: `5`)
- `data_bag['nslcd']['uid']` - specifies the user id with which the daemon should be run (default: `nslcd`)
- `data_bag['nslcd']['gid']` - specifies the group id with which the daemon should be run (default: `ldap`)
- `node['nslcd']['log']` - Controls the way logging is done, options SCHEME and LEVEL - syslog debug (default: ``)
- `data_bag['nslcd']['uri']` - specifies the LDAP URI of the server to connect to (default: `ldap://example.com`)
- `node['nslcd']['ldap_version']` - specifies the version of ldap protocol to use (default: ``)
- `data_bag['nslcd']['binddn']` - specifies the distinguised name with which to bind to the directory services for lookup (default: `DC=something,DC=here,DC=com`)
- `data_bag['nslcd']['bindpw']` - specifies the credentials with which to bind (default: `bindpasswd`)
- `data_bag['nslcd']['rootpwmoddn'` - specifies the distinguished name to use when the root user tires to modify a user's password using the PAM modules (default: ``)
- `data_bag['nslcd']['rootpwmodpw']` - specifies the credentials with which to bind if the root user tries to change a user's password (default: ``)
- `node['nslcd']['sasl']['enable']` - enable SASL configuration (default: `false`)
- `node['nslcd']['sasl']['mech']` - specifies the SASL mechanism to be used when performing SASL authentication (default ``)
- `node['nslcd']['sasl']['realm']` - specifies the SASL realm to be used (default '')
- `node['nslcd']['sasl']['authcid']` - specifies the authentication identity to be used when performing SASL authentication (default ``)
- `node['nslcd']['sasl']['authzid']` - specifies the authorization identity to be used when performing SASL authentication (default ``)
- `node['nslcd']['sasl']['secprops']` - specifies Cyrus SASL security properties (default: ``)
- `node['nslcd']['sasl']['canonicalize]` - specifies whether the LDAP server host name should be canonicalised (default ``)
- `node['nslcd']['krb5_ccname']` - Set the name for the GSS-API Kerberos credentials cache.
- `node['nslcd']['base']` - Specifies the base distinguished name (DN) to use as search base (default: `DC=something,DC=here,DC=com`)
- `node['nslcd']['scope']` - specifies the search scope (default: `sub`)
- `node['nslcd']['deref']` - specifies the policy for dereferencing aliases (default: `never`)
- `node['nslcd']['referrals']` - specifies whether automatic referral chasing should be enabled (default: `yes`)
- `node['nslcd']['bind_timelimit']` - specifies the time limit (in seconds) to use when connecting to the directory server (default: `10`)
- `node['nslcd']['timelimit']` - specifies the time limit (in seconds) to wait for a response from the LDAP server (default: `0`)
- `node['nslcd']['idle_timelimit']` - specifies the period of inactivity (in seconds) after which the connection to the LDAP server will be closed (default: ``)
- `node['nslcd']['reconnect_sleeptime']` - specifies the number of seconds to sleep when connecting to all LDAP servers fail (default: ``)
- `node['nslcd']['reconnect_retrytime']` - specifies the time after which the LDAP server is considered to be permanently unavailable (default: ``)
- `node['nslcd']['ssl']` - specifies whether to use SSL/TLS (default: `off`)
- `node['nslcd']['tls_reqcert']` - specifies what checks to perform on a server-supplied certificate (default: `never`)
- `node['nslcd']['tlscacertdir']` - specifies the directory containing the X.509 certificates for peer authentication (default: `/etc/openldap/cacerts`)
- `node['nslcd']['tls_cacertfile']` - specifies the path to the X.509 certificate for peer authentication (default: ``)
- `node['nslcd']['tls_randfile']` - specifies the path to an entropy source (default: ``)
- `node['nslcd']['tls_ciphers']` - specifies the ciphers to use for TLS (default: ``)
- `node['nslcd']['tls_cert']` - specifies path to the file containing the local certificate for client TLS authentication (default: ``)
- `node['nslcd']['tls_key']` - specifies path to the file containing the private key for client TLS authentication (default: ``)
- `node['nslcd']['pagesize']` - set this to a number greater than zero to request paged results from the LDAP server (default: `0`)
- `node['nslcd']['nss_initgroups_ignoreusers']` - prevents group membership lookups through LDAP for specified users (default: `root`)
- `node['nslcd']['nss_min_uid']` - LDAP users with a numeric user id lower than specified value are ignored (default: ``)
- `node['nslcd']['nss_nested_groups']` - if set to yes the member attribute of a group may point to another group (default: ``) 
- `node['nslcd']['validnames']` - regex used to specify how user and group names are verified in the system (default: `/^[a-z0-9._@$()]([a-z0-9._@$() \\~-]*[a-z0-9._@$()~-])?$/i`)
- `node['nslcd']['ignorecase']` - specifies whether or not to perform searches for group, netgroup, passwd, protocols, rpc, services, and shadow maps using case-insensitive matching (default: ``)
- `node['nslcd']['pam_authz_search']` - allows flexible fine tuning of the authorization check that should be performed (default: ``)
- `node['nslcd']['pam_password_prohibit_message']` - disables password modification using pam_ldap and displays the message to the user (default: ``)
- `node['nslcd']['reconnect_invalidate']` - if set, on startup and whenver a connection to the LDAP server is re-established after an error the specified caches are flushed (default: ``)
- `node['nslcd']['cache']` - time entries are kept in the specified internal cache (default: ``)
- `node['nslcd']['filters']` - Array of filter mappings. See the example below on how to create the nested array. Class is required (default: `[]`) 
Usage
-----
#### Attributes
To use attributes for defining nslcd, set the attributes above on the node (or role) itself:

```json
{
    "default_attributes": {
        "nslcd": {
            "threads": 10,
            "uid":  "nslcduser",
            "gid":  "nslcdgroup",
            "filters": {
                "passwd": {
                    "class": "(ObjectClass=User)",
                    "maps": {
                        "uid": "msSFU30Name",
                        "uidNumber": "msSFU30UidNumber"
                    }
                },
                "shadow": {
                    "class": "(ObjectClass=User)",
                    "maps": {
                        "uid": "msSFU30Name",
                        "userPassword": "msSFU30Password"
                    }
                }
            }
        }
    }
}
```

```ruby
default_attributes(
    "nslcd" => {
        "threads": 10,
        "uid": "nslcduser",
        "gid": "nslcdgroup",
        "filters" => {
            "passwd" => {
                "objectClass": "User",
                "maps" => {
                    "uid" => "msSFU30Name",
                    "uidNumber": "msSFU30UidNumber"
                }
            },
            "shadow"=> {
                "objectClass": "User",
                "maps" => {
                    "uid" => "msSFU30Name",
                    "userPassword" => "msSFU30Password"
                }
            }
        }
    }
)
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
- Author:: Dann S Washko <dwashko@gmti.gannett.com>

```text 

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
