APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

begin
  # Require the preresolved locked set of gems.
  require ::File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fallback on doing the resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end

require 'sinatra'
require 'compass'
require 'jim/rack'

class SammyjsOrg < Sinatra::Application

  use Jim::Rack, {
    :jimfile     => APP_ROOT + '/Jimfile',
    :bundle_uri => '/javascripts/',
  }
  configure do
    Compass.configuration do |config|
      config.project_path = APP_ROOT
      config.sass_dir = APP_ROOT + 'views/scss'
    end

    set :haml, { :format => :html5 }
    set :scss, Compass.sass_engine_options

    set :root, APP_ROOT

  end

  before do
    @current_version = '0.6.3'
  end

  get '/' do
    haml :index
  end

  get '/css/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    scss :"scss/#{params[:name]}"
  end

  get '*' do
    @small_header = true
    path = params[:splat].join
    haml "= textile(:\"#{path}\")"
  end
end
