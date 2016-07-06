#
# Cookbook Name:: sysauth
# Recipe:: mkhome
#
# Copyright (c) 2016 Mike McCarthy, All Rights Reserved.

case node['platform']
when 'redhat','centos'
  %w(oddjob-mkhomedir).each do |pkg|
    package pkg do
      action :install
      only_if { node['sysauth']['flags']['mkhome'] == 'true' }
    end
  end

  execute 'authconfig' do
    command 'authconfig --update --enablemkhomedir'
    only_if { node['sysauth']['flags']['mkhome'] == 'true' }
  end
end

