#
# Cookbook Name:: sysauth
# Recipe:: sudo
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

  template "/etc/sudoers" do
    source "sudoers.erb"
    owner "root"
    group "root"
    mode "0600"
  end
