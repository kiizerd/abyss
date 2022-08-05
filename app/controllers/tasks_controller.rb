class TasksController < ApplicationController
  before_action :set_project

  def index
    @tasks = Task.where(project_id: @project.id)
    redirect_to @project
  end

  def create
    @task = @project.tasks.create(task_params)
    redirect_to @project
  end

  def update
    @task = @project.tasks.find(params[:id])
    @task.update(task_params)
  end

  def complete
    @task = @project.tasks.find(params[:id])
    @task.update(status: 3)
    redirect_to @project
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to @project, status: 303
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def task_params
      params.require(:task).permit(:name, :status)
    end
end
