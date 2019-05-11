# frozen_string_literal: true

template '/etc/logrotate.d/unicorn' do
  owner 'root'
  group 'root'
  source './templates/etc/logrotate.d/unicorn.erb'
end
