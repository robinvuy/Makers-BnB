require_relative 'user'

class UserRepository

  def find(email)
    sql = 'SELECT * FROM users WHERE email = $1'
    result_set = DatabaseConnection.exec_params(sql, [email])
    user = User.new
    user.id = result_set[0]['id'].to_i
    user.username = result_set[0]['username']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password_digest']

    return user
  end
  
  def create(user)
    sql = 'INSERT INTO users (username, email, password_digest) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [user.username, user.email, user.password])

    return user
 
  end
end