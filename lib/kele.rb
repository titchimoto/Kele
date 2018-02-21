require 'httparty'
require 'json'
require_relative 'roadmap'

class Kele
  include HTTParty
  include Roadmap

  def initialize(email, password)
    @email = email
    @password = password
    @bloc_api = 'https://www.bloc.io/api/v1'
    response = self.class.post("#{@bloc_api}"'/sessions', body: { email: @email, password: @password })
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

  def get_messages(page = nil)
    if page == nil
      response = self.class.get("#{@bloc_api}" + "/message_threads", headers: { "authorization" => @auth_token })
    else
      response = self.class.get("#{@bloc_api}" + "/message_threads", body: { "page": page }, headers: { "authorization" => @auth_token })
    end
    JSON.parse(response.body)
  end

  def create_message(recipient_id, messagebody, subject = nil, token = nil)
    response = self.class.post("#{@bloc_api}" + "/messages",
      body: {
        "sender": @email,
        "recipient_id": recipient_id,
        "token": token,
        "subject": subject,
        "stripped-text": messagebody
      },
      headers: { "authorization" => @auth_token })
    end

    def create_submission(checkpoint_id, enrollment_id, comment = nil, assignment_branch = nil, assignment_commit_link = nil)
      response = self.class.post("#{@bloc_api}" + "/checkpoint_submissions",
        body: {
          "checkpoint_id": checkpoint_id,
          "enrollment_id": enrollment_id,
          "assignment_branch": assignment_branch,
          "assignment_commit_link": assignment_commit_link,
          "comment": comment
        },
        headers: { "authorization" => @auth_token })


    end



end
