module IssuesHelper
  def issue_complete_path issue
    "/projects/#{issue.project.id}/issues/#{issue.id}/complete"
  end

  def new_issue_form project, &block
    issue = project.issues.build
    form_with model: [project, issue] do |form|
      yield(form)
    end
  end
  
  def new_issue_name_field form
    form.text_field :name,
                    class: "issue-form-field",
                    placeholder: "New issue"
  end

  def new_issue_body_field form
    form.text_area :body,
                   class: "issue-form-field",
                   placeholder: "Issue body"
  end
end
