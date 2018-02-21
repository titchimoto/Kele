module Roadmap

  def get_roadmap(roadmap_id)
    response = self.class.get("#{@bloc_api}" + "/roadmaps/" + "#{roadmap_id}", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get("#{@bloc_api}" + "/checkpoints/" + "#{checkpoint_id}", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

end
