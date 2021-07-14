require 'bundler'
Bundler.require
ActiveRecord::Base.logger = nil

require_all 'app'

