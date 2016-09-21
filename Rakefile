require File.expand_path('../config/environment', __FILE__)

namespace :db do
  DB_PATH         = Pathname(File.expand_path('../db', __FILE__))
  MIGRATIONS_PATH = DB_PATH.join('migrate')
  SCHEMA_PATH     = DB_PATH.join('schema.rb')

  task :migrate do
    ActiveRecord::Migrator.migrate(MIGRATIONS_PATH)
    Rake::Task['db:schema:dump'].invoke
  end

  task :rollback do
    ActiveRecord::Migrator.rollback(MIGRATIONS_PATH)
    Rake::Task['db:schema:dump'].invoke
  end

  namespace :schema do
    task :dump do
      File.open(SCHEMA_PATH, 'w') do |file|
        conn = ActiveRecord::Base.connection
        ActiveRecord::SchemaDumper.dump(conn, file)
      end
    end
  end
end
