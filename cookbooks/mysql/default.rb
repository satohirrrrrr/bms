# frozen_string_literal: true

execute 'yum -y remove mysql*'

package 'mysql57-server'
package 'mysql57-devel'

remote_file '/etc/my.cnf' do
  owner 'root'
  group 'root'
  mode '644'
  source './files/etc/my.cnf'
end

service 'mysqld' do
  action %i[enable start]
end
