require 'spec_helper'

describe WiotSdk do
  it 'has a version number' do
    expect(WiotSdk::VERSION).not_to be nil
  end

  it 'send  a request' do
    client = WiotSdk.init(
        username: 'go_',
        api_key: '8b126716-5680-45f1-ad17-cbee7a472da6',
        space: 'asd',
        project: 'asd',
        base_url: 'http://0.0.0.0:3002'
    )

    metric = WiotSdk::Metric.new
    metric.add('free_space', 20)

    response = client.send(metric)
    expect(response).not_to be nil
  end
end
