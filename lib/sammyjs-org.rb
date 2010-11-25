APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

require 'rubygems'
require 'sinatra'
require 'haml'
require 'compass'

class SammyjsOrg < Sinatra::Application

  configure do
    Compass.configuration do |config|
      config.project_path = File.dirname(__FILE__)
      config.sass_dir = 'views/css'
    end

    set :haml, { :format => :html5 }
    set :sass, Compass.sass_engine_options

    set :root, APP_ROOT
    # use Jim::Rack, {
    #   :jimfile     => APP_ROOT + '/jimfile',
    #   :bundled_uri => '/javascripts/bundled.js',
    #   :compressed_uri => '/javascripts/compressed.js'
    # }

  end

  get '/' do
    haml :index
  end

  get '/css/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    scss :"css/#{params[:name]}"
  end

end
