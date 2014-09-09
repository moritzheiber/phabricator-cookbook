default['mysql']['server_root_password'] = 'root'

default['deploy_prefix'] = '/srv/www'
default['deploy_user'] = 'www-data'
default['deploy_group'] = 'www-data'
default['deploy_branch'] = 'master'

default['phabricator']['database_name'] = 'phabricator'
default['phabricator']['domain'] = 'phabricator.local'

default['phabricator']['app_root'] = "#{node['deploy_prefix']}/phabricator"
default['phabricator']['git_branch'] = node['deploy_branch']
default['phabricator']['deploy_user'] = node['deploy_user']
default['phabricator']['deploy_group'] = node['deploy_group']

default['phabricator']['inner_port'] = 7000
default['phabricator']['outer_port'] = 7000

default['libphutil']['app_root'] = "#{node['deploy_prefix']}/libphutil"
default['libphutil']['git_branch'] = node['deploy_branch']
default['libphutil']['deploy_user'] = node['deploy_user']
default['libphutil']['deploy_group'] = node['deploy_group']

default['arcanist']['app_root'] = "#{node['deploy_prefix']}/arcanist"
default['arcanist']['git_branch'] = node['deploy_branch']
default['arcanist']['deploy_user'] = node['deploy_user']
default['arcanist']['deploy_group'] = node['deploy_group']
