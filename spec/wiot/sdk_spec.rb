require 'spec_helper'

describe WiotSdk do
  it 'has a version number' do
    WiotSdk.init('', '', '')

    expect(WiotSdk::VERSION).not_to be nil
  end
end
