# frozen_string_literal: true

package 'nginx' do
  action :install
end

execute 'chage ownwer' do
  user 'root'
  command 'chown -R ec2-user /var/lib/nginx'
end

directory '/etc/nginx/sites-available' do
  owner 'root'
  group 'root'
  mode '644'
end

template '/etc/nginx/nginx.conf' do
  owner 'root'
  group 'root'
  mode '644'
  source './templates/etc/nginx/nginx.conf.erb'
  notifies :restart, 'service[nginx]'
end

remote_file '/etc/logrotate.d/nginx' do
  source './files/etc/logrotate.d/nginx'
end

remote_file '/etc/nginx/mine.types' do
  source './files/etc/nginx/mine.types'
end

service 'nginx' do
  action %i[enable start]
end
