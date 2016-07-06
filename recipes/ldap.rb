#
# Cookbook Name:: sysauth
# Recipe:: ldap
#
# Copyright (c) 2016 Mike McCarthy, All Rights Reserved.

case node['platform']
when 'redhat', 'centos'
  %w(sssd sssd-ldap).each do |pkg|
    package pkg do
      action :install
    end
  end
end

case node['platform']
when 'redhat', 'centos'
  template "/etc/sssd/sssd.conf" do
    source "sssd.conf.erb"
    owner "root"
    group "root"
    mode "0600"
    notifies :restart, 'service[sssd]', :delayed
    variables({
      :krb_realm => node['sysauth']['krb5']['realm'],
      :krb_kdc => node['sysauth']['krb5']['kdc'],
      :ldap_server => node['sysauth']['ldap']['server'],
      :ldap_base => node['sysauth']['ldap']['base']
    })
  end

  service 'sssd' do
    action [:enable, :start]
    supports :status => true, :start => true, :stop => true, :restart => true
  end

  execute 'authconfig' do
    command "authconfig --update --enableldap --ldapserver=#{node['sysauth']['ldap']['server']} --ldapbasedn=#{node['sysauth']['ldap']['base']}"
  end
end

