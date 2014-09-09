include_recipe 'mysql::server'

%w{mysql-client libmysqlclient-dev build-essential}.each do |pack|
  package pack do
    action :nothing
  end.run_action(:install)
end
chef_gem 'mysql' do
  action :nothing
end.run_action(:install)

mysql_database node['phabricator']['database_name'] do
  connection(
    :host     => 'localhost',
    :username => 'root',
    :password => node['mysql']['server_root_password']
  )
  action :create
end
