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
end
