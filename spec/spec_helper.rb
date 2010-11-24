require 'sinatra'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'lib', 'sammyjs-org.rb')

SammyjsOrg.set(
  :environment => :test,
  :run => false,
  :raise_errors => true,
  :logging => false
)

module TestHelper

  def app
    SammyjsOrg.new
  end

  def body
    last_response.body
  end

  def status
    last_response.status
  end

  include Rack::Test::Methods

end

require 'bacon'

Bacon::Context.send(:include, TestHelper)
