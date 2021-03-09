class IdeasController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @idea = Idea.new
  end

  def create
  end

end
