APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

require "rubygems"
require "bundler"
Bundler.require

require 'sinatra'
require 'compass'

class SammyjsOrg < Sinatra::Application

  configure do
    Compass.configuration do |config|
      config.project_path = APP_ROOT
      config.sass_dir = APP_ROOT + 'views/scss'
    end

    set :haml, { :format => :html5, :output_style => :ugly }
    set :scss, Compass.sass_engine_options

    set :root, APP_ROOT

  end

  before do
    @current_version = '0.6.2'
  end

  get '/' do
    haml :index
  end

  get '/css/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    scss :"scss/#{params[:name]}"
  end

  get '/docs/api/header' do
    haml :"docs/api/header", :layout => :simple
  end

  get '/docs/api/?:version?/:page?' do
    @general_header = true
    @version = params[:version] || @current_version
    @page = params[:page] || 'index'
    puts @page.inspect
    if @page =~ /\.html$/
      haml "= html('docs/api/#{@version}/#{@page}')", :layout => :simple
    else
      haml :api, :layout => false
    end
  end

  get '*' do
    @general_header = true
    path = params[:splat].join
    haml "= textile(:\"#{path}\")"
  end

  private
  def html(path)
    File.read(File.join(APP_ROOT, "views", path))
  end
end
