require 'activerecord'
require 'activesupport'
require 'models/contact'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :dbfile =>  'db/lanceballdotcom.sqlite3.db'
)

