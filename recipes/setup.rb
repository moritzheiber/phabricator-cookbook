template "#{node['phabricator']['app_root']}/conf/local/local.json" do
  source 'local.json.erb'
  owner node['phabricator']['deploy_user']
  group node['phabricator']['deploy_group']
  mode 00644
  notifies :run, 'bash[Run database initialization]', :immediately
end

bash 'Run database initialization' do
  user node['phabricator']['deploy_user']
  cwd node['phabricator']['app_root']
  code 'bin/storage upgrade --force'
  action :nothing
end
