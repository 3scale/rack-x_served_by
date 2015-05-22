require 'spec_helper'
require 'rack/x_served_by'

RSpec.describe Rack::XServedBy do
  let(:hostname) { 'some-host' }

  it 'gets hostname from socket' do
    expect(Socket).to receive(:gethostname).and_return(hostname)
    expect(described_class.hostname).to be(hostname)
  end

  context 'middleware' do
    let(:hostname) { Socket.gethostname }

    subject(:middleware) { described_class.new(app) }

    let(:app) do
      lambda { |_env| [200, {'Content-Type' => 'text/plain'}, 'Hello, World!'] }
    end

    it 'has a version number' do
      expect(Rack::XServedBy::VERSION).not_to be nil
    end

    it 'has hostname' do
      expect(middleware.hostname).to eq(hostname)
    end

    it 'allows hostname change' do
      changed = middleware.hostname = 'some-hostname'
      expect(middleware.hostname).to eq(changed)
    end

    it 'adds hostname to the response' do
      _status, headers, _body = middleware.call({})
      expect(headers).to include('X-Served-By' => hostname)
    end

    it 'accepts hostname' do
      middleware = described_class.new(app, hostname)
      expect(middleware.hostname).to be(hostname)
    end
  end


  it 'loads rack-x_served_by' do
    require 'rack-x_served_by'
  end
end
