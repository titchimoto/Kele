require 'httparty'
require 'json'

class Kele
  include HTTParty

  def initialize(email, password)
    @email = email
    @password = password
    @bloc_api = 'https://www.bloc.io/api/v1'
    response = self.class.post("#{@bloc_api}"'/sessions', query: { email: @email, password: @password })
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get("#{@bloc_api}"'/users/me', headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get("#{@bloc_api}" + "/mentors/" + "#{mentor_id}" + "/student_availability", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

end
