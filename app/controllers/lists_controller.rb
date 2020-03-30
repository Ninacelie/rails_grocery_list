class ListsController < ApplicationController
  before_action :redirect_if_not_logged_in 

  # get
  def new
    @list = List.new
  end 

  # post 
  def create 
    #puts "params = #{params}"
    #list_fields = list_params; 
    #list_fields[:user_id] = @user(params:[:user_id])
    @user = current_user
    list_fields = list_params
    list_fields[:user_id] = @user.id; 
    puts "IN CREATE METHOD, list_params = #{list_fields}"
    @list = List.new(list_fields)
    if @list.save 
      puts "** REDIRECTING TO USERS ***"
      redirect_to "/users/#{@user.id}" # users home page 
    else
      puts "** list.save returned false !!!! ***"
      render :new # back to sign up 
    end 
  end 

  def update 
    puts "params = #{params}"
    @list = List.find(params[:id])

    puts "@list id  = #{@list.id}"

    @list.update(title: params[:list][:title], content: params[:list][:content])
    redirect_to "/lists"
  end 

  def index 
    @user = current_user
    @lists = List.where(user_id: @user.id)
  end 

  def show 
    list_id = params[:id]
    @list = List.find(list_id)
  end

  private

  def list_params
    params.require(:list).permit(:title, :content)
  end 
end 