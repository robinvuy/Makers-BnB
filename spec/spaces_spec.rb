require 'spaces'
require 'spaces_repository'

RSpec.describe Spaces do
  it 'can create a new space' do
    repo = SpacesRepository.new
    space = repo.create(space)
  
    expect(space.name).to eq 'My Space'
    expect(space.description).to eq 'The best space ever'
    expect(space.price).to eq 100
  end
end

