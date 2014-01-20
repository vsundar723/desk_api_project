ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

RSpec.configure do |config|
  # Force tests to render views to catch errors with template rendering
  # config.render_views = true
end
