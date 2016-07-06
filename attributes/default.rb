### general flags
# mkhome - set to true to enable making homedirs. 
default['sysauth']['flags']['mkhome'] = 'true'

### kerberos attributes
# kerberos realm
default['sysauth']['krb5']['realm'] = 'EXAMPLE.REALM.NET'
# kerberos kdc server
default['sysauth']['krb5']['kdc'] = 'kdc.example.net'
# kerbaros admin server
default['sysauth']['krb5']['kadmin'] = 'kadmin.example.net'

### LDAP attributes
# LDAP server
default['sysauth']['ldap']['server'] = 'ldap.example.net'
# LDAP search base
default['sysauth']['ldap']['base'] = 'dc=example,dc=net'

### sudo attributes
# sudoer groups
default['sysauth']['sudo']['groups'] = [ 'sudoers','wheel' ]


