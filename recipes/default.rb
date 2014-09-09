include_recipe 'phabricator::mysql_server'
include_recipe 'phabricator::service'

%w{git php5-cli php5-curl php5-mcrypt php5-gd php5-mysql}.each do |p|
  package p
end

ruby_block 'Modify /etc/hosts' do
  block do
    file = Chef::Util::FileEdit.new('/etc/hosts')
    file.insert_line_if_no_match("/#{node['phabricator']['domain']}/", "0.0.0.0 #{node['phabricator']['domain']}")
    file.write_file
  end
end

directory '/srv/www' do
  owner node['phabricator']['deploy_user']
  group node['phabricator']['deploy_group']
end

git node['phabricator']['app_root'] do
  repository 'https://github.com/phacility/phabricator.git'
  user node['phabricator']['deploy_user']
  group node['phabricator']['deploy_group']
end

git node['libphutil']['app_root'] do
  repository 'https://github.com/phacility/libphutil.git'
  user node['libphutil']['deploy_user']
  group node['libphutil']['deploy_group']
end

git node['arcanist']['app_root'] do
  repository 'https://github.com/phacility/arcanist.git'
  user node['arcanist']['deploy_user']
  group node['arcanist']['deploy_group']
end

template '/etc/init/phabricator.conf' do
  source 'phabricator.upstart.conf.erb'
  owner 'root'
  group 'root'
  notifies :start, 'service[phabricator]', :immediately
end

include_recipe 'phabricator::setup'
