class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.create(title: "New Project", user_id: current_user.id)
    redirect_to @project, notice: "Project Created"
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(params.require(:project).permit(:title))
      respond_to do |format|
        format.html { redirect_to @project, :notice => 'Project was successfully updated.' }
        format.json { respond_with_bip(@project) }
      end
    else
      respond_to do |format|
        format.html { redirect_to@project, :notice => 'Something went wrong.' }
        format.json { respond_with_bip(@project) }
      end
    end
  end
end
