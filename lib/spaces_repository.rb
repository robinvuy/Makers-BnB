require 'spaces'

class SpacesRepository
  def all
    sql = 'SELECT * FROM spaces;'
    result = DatabaseConnection.exec_params(sql, [])

    all_spaces = []
    result.each do |space|
        space = Spaces.new

        space.id = space['id']
        space.name = space['name']
        space.description = space['description']
        space.price = space['price']
        space.user_id = space['user_id']

        all_spaces << space
    end
    return all_spaces
  
  end


  def create(space)
    sql = 'INSERT INTO spaces (name, description, price, user_id) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [space.name, space.description, space.price, space.user_id])

    return space
  end

end