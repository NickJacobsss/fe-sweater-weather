class UserService

  def self.connection
    Faraday.new(url: 'https://be-sweater-weather.herokuapp.com/api/v1/')
  end

  def self.create_user(user_data)
      response = connection.post('users') do |user|
        user.params[:email] = user_data[:email]
        user.params[:password] = user_data[:password]
        user.params[:password_confirmation] = user_data[:password_confirmation]
      end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.login_user(user_data)
    response = connection.post('sessions') do |user|
      user.params[:email] = user_data[:email]
      user.params[:password] = user_data[:password]
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
