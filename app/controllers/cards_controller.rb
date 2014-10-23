class CardsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @card = Card.create(title: "New Card", body: "Write something awesome here....", project_id: @project.id )
    redirect_to @project, notice: "New Card Added"
  end

  def update

  end

  def destroy

  end

end
