require 'httparty'

class Kele
  include HTTParty

  def initialize(email, password)
    @email = email
    @password = password
    @bloc_api = 'https://www.bloc.io/api/v1'
    @auth_token = self.class.post("#{@bloc_api}"'/sessions', query: { email: @email, password: @password })
  end

end
