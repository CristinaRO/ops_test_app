require File.expand_path('../config/environment', __FILE__)

require 'sinatra'
require 'ops_test_app'

run OpsTestApp.new
