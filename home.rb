require 'rubygems'
require 'sinatra'
require 'helpers'
require 'haml'

get '/' do
  haml :home
end

get '/:page' do |page|
  haml page.to_sym
end

get '/styles/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :application
end