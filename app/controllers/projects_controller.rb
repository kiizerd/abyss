class ProjectsController < ApplicationController
  def index
    @projects = Project.most_active_first
    respond_to do |format|
      format.html # index.html.erb
      format.json do
        render json: { projects: @projects }
      end
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project }
        format.json do
          render json: { projects: @projects }, status: :created
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: {
            project: @project.to_json,
            errors: @project.errors.full_messages
          }, status: :unprocessable_entity
        end
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
