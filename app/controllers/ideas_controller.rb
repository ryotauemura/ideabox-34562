class IdeasController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def idea_params
    params.require(:idea).permit(:title,:purpose,:description).merge(user_id: current_user.id)
  end

end
