require 'sinatra'
# require 'sinatra/reloader'

get '/' do
  @page_title = "home"
  erb :home
end
