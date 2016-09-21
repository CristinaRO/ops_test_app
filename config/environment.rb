require 'bundler/setup'
require 'active_record'

ROOT = Pathname(File.expand_path('../..', __FILE__))

%w[lib lib/models].each do |path|
  ActiveSupport::Dependencies.autoload_paths << ROOT.join(path)
end

ActiveRecord::Base.establish_connection \
  adapter:  'mysql2',
  username: ENV.fetch('MYSQL_USERNAME'),
  password: ENV.fetch('MYSQL_PASSWORD'),
  database: 'ops_test'
