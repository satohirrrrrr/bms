# frozen_string_literal: true

include_recipe 'selinux::disabled'
include_recipe 'cookbooks/base/default.rb'
include_recipe 'cookbooks/mysql/default.rb'
include_recipe 'cookbooks/redis/default.rb'
include_recipe 'cookbooks/nginx/default.rb'
include_recipe 'cookbooks/unicorn/default.rb'
include_recipe 'cookbooks/ruby/default.rb'
