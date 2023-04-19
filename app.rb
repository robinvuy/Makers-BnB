require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/spaces_repository'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/spaces' do
    repo = SpacesRepository.new
    @spaces = repo.all
    return erb(:spaces)
  end

  get '/spaces/new_space' do
    return erb(:new_space)
  end

  post '/spaces/new_space' do
    repo = SpacesRepository.new
    space = Spaces.new
    space.name = params[:name]
    space.price = params[:price]
    space.description = params[:description]
    space.user_id = params[:user_id]
    repo.create(space)
  
    redirect '/spaces'
  end
end