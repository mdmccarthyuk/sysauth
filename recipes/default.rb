#
# Cookbook Name:: sysauth
# Recipe:: default
#
# Copyright (c) 2016 Mike McCarthy, All Rights Reserved.

include_recipe 'sysauth::krb5'
include_recipe 'sysauth::ldap'
include_recipe 'sysauth::mkhome'

