package "redis" do
  action :install
end

service "redis" do
  action %i[enable start]
end