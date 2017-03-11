#
# Cookbook Name:: demo
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# include_recipe 'java'
directory '/tmp/folder' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
