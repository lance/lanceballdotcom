require 'rubygems'
require 'sinatra'
require File.expand_path(File.dirname(__FILE__) + '/lib/config')
require File.expand_path(File.dirname(__FILE__) + '/lib/authorization')
require File.expand_path(File.dirname(__FILE__) + '/models/contact')
require File.expand_path(File.dirname(__FILE__) + '/helpers')


get '/' do
  haml :home
end

get '/contact' do
  @contact = Contact.new
  haml :contact
end

post '/contact' do
  @contact = Contact.new(params['contact'])
  if (@contact.save)
    @contact = Contact.new
    @notice = "I got the message - thanks! I'll contact you shortly."
  end
  haml :contact
end

get '/contacts' do
  if require_admin
    @contacts = Contact.find(:all)
    haml :contacts
  end
end

get '/:page' do |page|
  haml page.to_sym
end

get '/styles/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :application
end

