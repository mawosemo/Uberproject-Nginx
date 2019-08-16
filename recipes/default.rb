#
# Cookbook:: Nginx
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
apt_update 'update_sources' do
    action :update
end


package "nginx"
# package "nodejs"
service "nginx" do
  action :enable
end
service "nginx" do
  action :start
end
