$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'wiot-sdk'
require 'rspec'

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start