service 'phabricator' do
  supports :restart => false, :reload => false, :status => false
  provider Chef::Provider::Service::Upstart
  action :nothing
end
