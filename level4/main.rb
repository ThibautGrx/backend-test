require 'date'
require 'json'

Dir['./lib/*.rb'].each { |file| require file }

DrivyTest.new.resolve
