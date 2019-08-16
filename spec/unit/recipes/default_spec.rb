#
# Cookbook:: Nginx
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'Nginx::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  it 'should install nginx'do
    expect(chef_run).to install_package "nginx"
  end
  it 'should enable nginx'do
    expect(chef_run).to enable_service "nginx"
  end
  it 'should be start nginx'do
    expect(chef_run).to start_service "nginx"
  end
  # created a symlink an put files in sites available so that the files are running but runnig in the back ground where no un authorised person can access these files
  it 'should create a proxy.conf template in /etc/nginx/sites-available' do
    expect(chef_run).to create_template("/etc/nginx/sites-available/proxy.conf").with_variables(proxy_port: 3000)
    end
  it 'should create a symlink of proxy.conf from sites-availableto sites-enabled' do
    expect(chef_run).to create_link("/etc/nginx/sites-enabled/proxy.conf").with_link_type(:symbolic)#creates a symbolic link from sites- available to sites - be_enabled
  end
  it 'should delete the symlink from the default config in sites-enabled ' do
    expect(chef_run).to delete_link('/etc/nginx/sites-enabled/default')
  end
end
