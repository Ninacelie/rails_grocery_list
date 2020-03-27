class ListsController < ApplicationController
  before_action :redirect_if_not_logged_in 

  def new
    @list = List.new
  end 

  def create 

  end 

  private

  def list_params
    params.require(:list).permit(:title, :content)
  end 
end 