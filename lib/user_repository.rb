require_relative 'user'

class UserRepository

  def find
    user = User.new
    user.username = 'JSmith'
    user.email = 'jsmith@hotmail.co.uk'
    user.password = 'password1234'

    return user
  end
end