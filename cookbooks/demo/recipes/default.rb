#
# Cookbook Name:: demo
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - feel free to Redistribute
#

# make sure we have java installed
include_recipe 'java'

user 'tomcat'

# put chefed in the group so we can make sure we don't remove it by managing cool_group
group 'tomcat' do
  members 'tomcat'
  action :create
end

# Install Tomcat 8.0.36 to the default location
tomcat_install 'helloworld' do
  tarball_uri 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.36/bin/apache-tomcat-8.0.36.tar.gz'
  tomcat_user 'tomcat'
  tomcat_group 'tomcat'
end

# Drop off our own server.xml that uses a non-default port setup
cookbook_file '/opt/tomcat_helloworld/conf/server.xml' do
  source 'helloworld_server.xml'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'tomcat_service[helloworld]'
end

remote_file '/opt/tomcat_helloworld/webapps/sample.war' do
  owner 'tomcat'
  mode '0644'
  source 'https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war'
  checksum '89b33caa5bf4cfd235f060c396cb1a5acb2734a1366db325676f48c5f5ed92e5'
end

# start the helloworld tomcat service using a non-standard pic location
tomcat_service 'helloworld' do
  action [:start, :enable]
  env_vars [{ 'CATALINA_PID' => '/opt/tomcat_helloworld/bin/non_standard_location.pid' }, { 'SOMETHING' => 'some_value' }]
  sensitive true
  tomcat_user 'tomcat'
  tomcat_group 'tomcat'
end
