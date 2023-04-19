require "spec_helper"
require "rack/test"
require_relative "../../app"
require 'json'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # # We need to declare the `app` value by instantiating the Application
  # # class so our tests work.
  let(:app) { Application.new }

  # Write your integration tests below.
  # If you want to split your integration tests
  # accross multiple RSpec files (for example, have
  # one test suite for each set of related features),
  # you can duplicate this test file to create a new one.
  def reset_table_users
    seed_sql = File.read('spec/seeds/makersbnb_seed.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'makersbnb_test' })
  
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_table_users
  end
  
 def reset_table_spaces
    seed_sql = File.read('spec/seed.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'makersbnb_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_table_spaces()
  end
    context 'GET /spaces' do
    it 'should get the spaces page' do
      response = get('/spaces')

      expect(response.status).to eq(200)
      expect(response.body).to include('Spaces')
      expect(response.body).to include('description1')
    end
  end

  context 'GET /spaces/new_space' do 
    it ' should show the new space form' do
      response = get('/spaces/new_space')

      expect(response.status).to eq(200)
      expect(response.body).to include('List a Space')
      expect(response.body).to include('Name')
      expect(response.body).to include('Price per night')
    end
  end

  context 'POST /spaces/new_space' do 
    it 'should create a new space' do
      response = post('/spaces/new_space', 
      {name: 'My Space', price: 100, description: 'The best space ever', user_id: 1})
      
      response = get "/spaces"
      expect(response.status).to eq(200)
      expect(response.body).to include('My Space')
      expect(response.body).to include('100')
      expect(response.body).to include('The best space ever')

  context 'GET /login' do
    it 'retrieves user information from supplied email' do
      response = get('/login')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Login page</h2>')
    end
  end
  context 'POST /login' do
    it 'renders the login page 'do
      response = post('/login', email: 'alice@gmail.com', password: 'password_hash_for_alice') 
      expect(response.status).to eq(200)
      expect(response.body).to include('<title>You are logged in!</title>')
    end
  end
  
  context 'GET /logged_in' do
    it 'returns a page showing a successful log in' do
      response = get('/logged_in') 
      expect(response.status).to eq(200)
      expect(response.body).to include('<title>You are logged in!</title>')
      expect(response.body).to include('Congratulations! You have successfully logged in.')
    end
  end

  context 'POST /user_signup' do
    it 'sign up page for new users' do
      response = post('/user_signup', username: 'dave', email: 'dave@gmail.com', password: 'password_hash_for_dave') 
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Signup</h2>')

    end
  end
end
