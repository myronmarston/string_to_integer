require 'rubygems'
gem 'rspec', '2.1'
require 'rspec'
require 'string_to_integer'

String.send(:include, StringToInteger)

RSpec.configure do |c|
  c.color_enabled = true
end

