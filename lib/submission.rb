module Submission

  def create_submission(checkpoint_id, enrollment_id, comment = nil, assignment_branch = nil, assignment_commit_link = nil)
    response = self.class.post("#{@bloc_api}/checkpoint_submissions",
      body: {
        "checkpoint_id": checkpoint_id,
        "enrollment_id": enrollment_id,
        "assignment_branch": assignment_branch,
        "assignment_commit_link": assignment_commit_link,
        "comment": comment
      },
      headers: { "authorization" => @auth_token })
  end

  def update_submission(submission_id, checkpoint_id, enrollment_id, comment = nil, assignment_branch = nil, assignment_commit_link = nil)
    response = self.class.put("#{@bloc_api}/checkpoint_submissions/#{submission_id}",
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
