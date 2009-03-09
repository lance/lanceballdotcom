require 'rubygems'
require 'sinatra'
require 'haml'
require 'activerecord'
require 'activesupport'

dbconfig = YAML.load(File.read(File.expand_path(File.dirname(__FILE__) + '/../config/database.yml')))

configure :production do
  ActiveRecord::Base.establish_connection dbconfig['production']
end

configure :development do
  ActiveRecord::Base.establish_connection dbconfig['development']
end



