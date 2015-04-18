#
# Cookbook Name:: jenemc
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

yum_repository 'jenkins' do
	description "jenkins repository"
	baseurl "http://pkg.jenkins-ci.org/redhat/"
	gpgkey "http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key"
	action :create
end

yum_package "jenkins" do
	action :install
	flush_cache [:before]
end

service "jenkins" do
	supports [:stop, :start, :restart]
	action [:start, :enable]
end

yum_package "httpd" do
	action :install
	flush_cache [:before]
end

service "httpd" do
	supports [:stop, :start, :restart]
	action [:start, :enable]
end



