class LikesController < ApplicationController
  before_action :set_variables


  def like
    like = current_user.likes.new(idea_id: @idea.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(idea_id: @idea.id)
    like.destroy
  end

  private

  def set_variables
    @idea = Idea.find(params[:idea_id])
    @id_name = "#like-link-#{@idea.id}"
  end

end