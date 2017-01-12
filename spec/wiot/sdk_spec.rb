require 'spec_helper'
require 'wiot-sdk/version'

describe WiotSdk do
  it 'has a version number' do
    WiotSdk.init('', '', '')

    expect(WiotSdk::VERSION).not_to be nil
  end
end
