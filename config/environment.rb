require 'activerecord'
require 'activesupport'
require 'models/contact'

dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig['production']

