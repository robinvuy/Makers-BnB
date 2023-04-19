require_relative 'lib/database_connection'
require_relative 'lib/spaces_repository'
require_relative 'lib/user_repository'
require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader

    enable :sessions

  end

  get '/login' do
    return erb(:login)
  end
 
  post '/login' do
    email = params[:email]
    password = params[:password]

    repo = UserRepository.new
    user = repo.find(email)
    
    if user && user.password == password
      @user = user
    end
  return erb(:logged_in)
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
  get '/logged_in' do
    return erb(:logged_in)
  end

  get '/' do 
    return erb(:user_signup)
  end

  post '/user_signup' do
    
    repo = UserRepository.new
    new_user = User.new

    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]

    repo.create(new_user)
    return '<h2>Signup</h2>'
  end
end
