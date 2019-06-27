require 'date'
require 'json'
require 'pry'

Dir['./lib/*.rb'].each { |file| require file }

DrivyTest.new.resolve
