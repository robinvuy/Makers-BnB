require 'spaces'

class SpacesRepository
  def all
    sql = 'SELECT * FROM spaces;'
    result = DatabaseConnection.exec_params(sql, [])

    all_spaces = []
    result.each do |space_data|
        space = Spaces.new

        space.id = space_data['id']
        space.name = space_data['name']
        space.description = space_data['description']
        space.price = space_data['price'].to_i
        space.user_id = space_data['user_id']

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