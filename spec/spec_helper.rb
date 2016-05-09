$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'wiot_sdk'

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start