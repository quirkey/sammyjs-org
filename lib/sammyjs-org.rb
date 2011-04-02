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

  error do
    haml :not_found, :layout => :layout
  end

  not_found do
    haml :not_found, :layout => :layout
  end

  before do
    @current_version = '0.6.3'
  end

  get '/' do
    haml :index
  end

  get '/wiki' do
    redirect "http://github.com/quirkey/sammy/wiki"
  end

  get '/css/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    scss :"scss/#{params[:name]}"
  end

  get '/docs/api/header/:version' do
    @version = params[:version]
    @footer = false
    haml :"docs/api/header", :layout => :simple
  end

  get '/docs/api/stable/?' do
    redirect "/docs/api/#{@current_version}/all"
  end

  get '/docs/api/?:version?/?:page?' do
    @general_header = true
    @version = params[:version] || @current_version
    @page = params[:page] || 'all'
    @footer = false if @page == 'menu.html'
    @page ||= "all"
    @page = "index" if @page == 'all'
    haml "= html(:\"#{@page}\")", :layout => :api
  end

  get '*' do
    @general_header = true
    path = params[:splat].join
    haml "= textile(:\"#{path}\")"
  end

  private
  def html(path)
    path = File.join('docs', 'api', @version, "#{path}.html") if path.is_a?(Symbol)
    File.read(File.join(APP_ROOT, "views", path))
  end
end
