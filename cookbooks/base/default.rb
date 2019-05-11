# frozen_string_literal: true

execute 'yum_update' do
  user 'root'
  command 'yum -y update'
end

package 'epel-release' do
  action :install
end

%w[
  ruby-rdoc
  ruby-devel
  epel-release
  gcc
  gcc-c++
  make
  automake
  autoconf
  curl-devel
  openssl-devel
  libyaml-devel
  libxml2-devel
  libxslt-devel
  libffi-devel
  readline-devel
  zlib-devel
  httpd-devel
  sqlite-devel
  apr-util-devel
  bison
  flex
  git
].each do |pkg|
  package pkg
end

execute 'add nodejs repository' do
  command 'curl --silent --location https://rpm.nodesource.com/setup_10.x | sudo bash -'
end

package 'nodejs' do
  options '--enablerepo=epel'
  action :install
end
