require 'spec_helper'

describe WiotSdk do
  it 'has a version number' do
    expect(WiotSdk::VERSION).not_to be nil
  end

=begin
  it 'send  a request' do
    client = WiotSdk.init(
        username: 'go_',
        api_key: '8b126716-5680-45f1-ad17-cbee7a472da6',
        space: 'asd',
        project: 'asd',
        base_url: 'http://0.0.0.0:3002'
    )

    payload = WiotSdk::Payload.new
    payload.addMetric('server_name', 'my_server1')
    payload.addMetric('free_space', 18)

    response = client.send(payload)
    expect(response).not_to be nil
  end
=end
end
