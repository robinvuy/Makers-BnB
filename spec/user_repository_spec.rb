require 'user'
require 'user_repository'

def reset_albums_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: 'localhost', dbname: 'makersbnb_test'})
    connection.exec(seed_sql)
end

describe UserRepository do
    before(:each) do
      reset_users_table
end

  it 'finds an email' do
    repo = UserRepository.new
    users = repo.find('alice@gmail.com')

    expect(users.status).to eq(200)
    expect(users.username).to include('alice')
    expect(users.email).to include('alice@gmail.com')
    expect(users.password_digest).to include('password_hash_for_alice')
  end

  it 'creates a user' do
    repo = UserRepository.new
    new_user = User.new
    new_user.username = 'dave'
    new_user.email = 'dave@gmail.com'
    new_user.password_digest = 'password_hash_for_dave'

    repo.create(new_user)
      expect(users.status).to eq(200)
    expect(users.username).to include('dave')
    expect(users.email).to include('dave@gmail.com')
    expect(users.password_digest).to include('password_hash_for_dave')
  end
end