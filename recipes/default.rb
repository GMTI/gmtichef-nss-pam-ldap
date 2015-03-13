#
# Cookbook Name: nslcd
# Recipe: default

package node['nslcd']['package']

nssbagconfigs = data_bag_item(node['nslcd']['data_bag'], node['nslcd']['data_bag_name'])

template '/etc/nslcd.conf' do
  source 'nslcd.conf.erb'
  mode '0600'
  variables(
    nssbagconfigs: nssbagconfigs,
    settings:  node['nslcd']
    )
end

service 'nslcd' do
  action [:restart]
end
