
desc "Setup the environment"
  task :environment do
    require('lib/config')
end

namespace :db do
  desc "Migrate the database"
    task(:migrate => :environment) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end
end