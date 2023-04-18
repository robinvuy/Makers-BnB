require 'spaces'
require 'spaces_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/makersbnb_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'makersbnb_test' })

  connection.exec(seed_sql)
end


RSpec.describe SpacesRepository do
  before(:each) do
    reset_tables
  end

  it 'can create a new space' do
    repo = SpacesRepository.new
      space = Spaces.new
      space.name = 'My Space'
      space.price = 100
      space.description = 'The best space ever'
      space.user_id = 1
      repo.create(space)

    created_space = repo.all
  
    expect(created_space.last.name).to eq 'My Space'
    expect(created_space.last.price).to eq 100
    expect(created_space.last.description).to eq 'The best space ever'
  end

  it "lists all spaces" do
    repo = SpacesRepository.new
    spaces = repo.all
    expect(spaces.length).to eq 2
    expect(spaces.first.name).to eq 'space1'
    expect(spaces.last.name).to eq 'space2'
  end
end