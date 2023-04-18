require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/spaces_repository'

DatabaseConnection.connect('makersbnb_test')
class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  get '/spaces' do
    repo = SpacesRepository.new
    @spaces = repo.all
    return erb(:spaces)
  end

  get '/spaces/new_space' do
    return erb(:new_space)
  end
end