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


  context 'GET /user' do
    it 'retrieves user information from supplied email' do
      response = get('/user')

      expect(response.status).to eq(200)
      expect(response.body).to include('JSmith')
      expect(response.body).to include('jsmith@hotmail.co.uk')
      expect(response.body).to include('password1234')
    end

 
  end
end
