# Legion of Doom
# a frontend for mcollective-lxc-agent
# version 0.1
# by br0ch0n

require 'sinatra'
require 'mcollective'
include MCollective::RPC

get '/' do
	redirect to('/allhosts')
end
get '/allhosts' do
	@bazz = rpcclient("lxc")
	@bazz.agent_filter "lxc"
	erb :allhosts
end
get '/create' do
	@mc = rpcclient("lxc")
	@mc.agent_filter "lxc"
	erb :create
end
post '/create' do
	"Creating #{params[:name]} on #{params[:parent]}"
	@mc = rpcclient("lxc")
	@mc.identity_filter params[:parent]
	@mc.create(:name => params[:name], :templatename => params[:templatename], :templateopts => params[:templateopts])
	@mc.set_config_item(:name => params[:name], :configkey => 'lxc.start.auto', :configvalue => params[:autostart])
	unless params[:IP].empty?
		@mc.set_config_item(:name => params[:name], :configkey => 'lxc.network.0.ipv4', :configvalue => params[:IP])
	end
	unless params[:gateway].empty?
		@mc.set_config_item(:name => params[:name], :configkey => 'lxc.network.0.ipv4.gateway', :configvalue => params[:gateway])
	end
	unless params[:bridge].empty?
		@mc.set_config_item(:name => params[:name], :configkey => 'lxc.network.0.link', :configvalue => params[:bridge])
	end

	@mc.reset_filter
	@mc.disconnect
	"Great Success!"
	redirect to('/allhosts')
end
get '/startcontainer/:parent/:name' do
	@mc = rpcclient("lxc")
	@mc.identity_filter params[:parent]
	@mc.start(:name => params[:name])
	@mc.reset_filter
	redirect back
end
get '/stopcontainer/:parent/:name' do
	@mc = rpcclient("lxc")
	@mc.identity_filter params[:parent]
	@mc.stop(:name => params[:name])
	@mc.reset_filter
	redirect back
end
get '/destroycontainer/:parent/:name' do
	@mc = rpcclient("lxc")
	@mc.identity_filter params[:parent]
	@mc.destroy(:name => params[:name])
	@mc.reset_filter
	redirect to('/allhosts')
end
get '/confirmdestroy' do
	erb :confirmdestroy
end
