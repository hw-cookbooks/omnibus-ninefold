#
# Cookbook Name:: omnibus-ninefold
# Recipe:: default
#
# Copyright 2012, Heavy Water Operations, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "ubuntu"

node.default['ruby_installer']['package_name'] = "ruby1.9.3"
node.default['ruby_installer']['rubydev_package'] = "ruby1.9.1-dev"

include_recipe "ruby_installer"

include_recipe "reprepro"
include_recipe "build-essential"
include_recipe "git"

gem_package "bundler"

git node['omnibus-ninefold']['directory'] do
  repository node['omnibus-ninefold']['git_url']
  revision node['omnibus-ninefold']['git_branch']
  action node['omnibus-ninefold']['git_action']
end

execute "omnibus-ninefold: bundle" do
  command "bundle install --deployment"
  subscribes :run, resources(:git => node['omnibus-ninefold']['directory']), :immediately
  cwd node['omnibus-ninefold']['directory']
  creates File.join(node['omnibus-ninefold']['directory'], ".bundle")
end
