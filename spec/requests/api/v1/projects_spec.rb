require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /api/v1/projects" do
    it "returns a list of all projects, sorted by activity" do
      inactive_project = create(:project)
      active_project   = create(:project)

      get "/api/v1/projects.json"

      expect(json_body["projects"].count).to eq(2)

      active_project_json = json_body["projects"][0]
      expect(active_project_json).to include({
        "id" => active_project.id,
        "name" => active_project.name,
        "description" => active_project.description
      })
    end
  end

  describe "POST /api/v1/projects" do
    it "creates the project" do
      project_params = attributes_for(:project)

      post "/api/v1/projects.json", params: { project: project_params }

      # HTTP status code 201 = CREATED
      expect(response.status).to eq 201
      expect(Project.last.name).to eq project_params[:name]
    end

    context "when there are invalid attributes" do
      it "returns a 422, with errors" do
        project_params = attributes_for(:project, :invalid)
        
        post "/api/v1/projects.json", params: { project: project_params }
        
        # HTTP status code 422 = UNPROCESSABLE_ENTITY
        expect(response.status).to eq 422
        expect(json_body.fetch("errors")).not_to be_empty
      end
    end
  end
end
