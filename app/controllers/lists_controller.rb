class ListsController < ApplicationController
  before_action :redirect_if_not_logged_in 

  def new
    @list = List.new
  end 

end 