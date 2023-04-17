require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/user_repository'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/user' do
    repo = UserRepository.new
    @user = repo.find
    return erb(:user)
  end
end