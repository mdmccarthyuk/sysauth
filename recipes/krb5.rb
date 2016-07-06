#
# Cookbook Name:: sysauth
# Recipe:: krb5
#
# Copyright (c) 2016 Mike McCarthy, All Rights Reserved.

case node['platform']
when 'redhat', 'centos'
  %w(krb5-workstation pam_krb5).each do |pkg|
    package pkg do
      action :install
    end
  end 
end

template '/etc/krb5.conf' do
  source 'krb5.conf.erb'
  user 'root'
  group 'root'
  mode '0644'
end

case node['platform']
when 'redhat', 'centos'
  execute 'authconfig' do
    command "authconfig --update --enablekrb5 --krb5kdc=#{node['sysauth']['krb5']['kdc']} --krb5realm=#{node['sysauth']['krb5']['realm']}"
  end
end

