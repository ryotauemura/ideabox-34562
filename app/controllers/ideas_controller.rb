class IdeasController < ApplicationController
   before_action :authenticate_user!, only:[new,:create,:edit,:update,:destroy]
   before_action :set_idea, only: [:show,:edit,:update,:destroy]
   before_action :redirect_edit, only:[:edit,:update,:destroy]

  def index
    @idea2 = Idea.where({category_id: 2}).includes(:user).order("created_at DESC").search(params[:search])
    @idea3 = Idea.where({category_id: 3}).includes(:user).order("created_at DESC").search(params[:search])
    @idea4 = Idea.where({category_id: 4}).includes(:user).order("created_at DESC").search(params[:search])
    @idea5 = Idea.where({category_id: 5}).includes(:user).order("created_at DESC").search(params[:search])
    @idea6 = Idea.where({category_id: 6}).includes(:user).order("created_at DESC").search(params[:search])
    @idea7 = Idea.where({category_id: 7}).includes(:user).order("created_at DESC").search(params[:search])
    @idea8 = Idea.where({category_id: 8}).includes(:user).order("created_at DESC").search(params[:search])
    @idea9 = Idea.where({category_id: 9}).includes(:user).order("created_at DESC").search(params[:search])
    @idea10 = Idea.where({category_id: 10}).includes(:user).order("created_at DESC").search(params[:search])
    @idea11 = Idea.where({category_id: 11}).includes(:user).order("created_at DESC").search(params[:search])
    @idea12 = Idea.where({category_id: 12}).includes(:user).order("created_at DESC").search(params[:search])
    @idea13 = Idea.where({category_id: 13}).includes(:user).order("created_at DESC").search(params[:search])
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
