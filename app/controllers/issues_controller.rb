class IssuesController < ApplicationController
  before_action :set_project

  def index
    @issues = Issue.where(project_id: @project.id)
    redirect_to @project
  end

  def create
    @issue = @project.issues.create(issue_params)
    redirect_to @project
  end

  def update
    @issue = @project.issues.find(params[:id])
    @issue.update(issue_params)
  end

  # toggles completion status
  def complete
    @issue = @project.issues.find(params[:id])
    @issue.update(status: @issue.complete? ? 1 : 3)
    redirect_to @project
  end

  def destroy
    @issue = @project.issues.find(params[:id])
    @issue.destroy
    redirect_to @project, status: 303
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def issue_params
      params.require(:issue).permit(:name, :body, :status)
    end
end
