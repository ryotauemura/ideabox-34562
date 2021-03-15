class IdeasController < ApplicationController
   before_action :authenticate_user!, only:[new,:create,:edit,:update,:destroy]
   before_action :set_idea, only: [:show,:edit,:update,:destroy]
   before_action :redirect_edit, only:[:edit,:update,:destroy]

  def index
    @idea = Idea.includes(:user).order("created_at DESC").search(params[:search])
    
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

  def show
    @comment = Comment.new
    @comments = @idea.comments.includes(:user)
  end

  def edit
  end

  def update
    if @idea.update(idea_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy  
    redirect_to root_path
  end

  private
  
  def idea_params
    params.require(:idea).permit(:title,:purpose,:description,:category_id).merge(user_id: current_user.id)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def redirect_edit
    if current_user.id != @idea.user.id
      redirect_to root_path
    end
  end

end
