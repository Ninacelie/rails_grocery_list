class ItemsController < ApplicationController 

  def index
    if params[:post_id] && @post = Post.find_by_id(params[:post_id]) 
      # if is nested and post exists 
      @items = 
    else 
      @items = Item.all 
  end 

  def new
    @item = Item.new 
  end 

  def create
    @item = current_user.items.build(item_params)
    if @item.save 
      redirect_to items_path 
    else 
      render :new 
    end 
  end 
  
  def show 
    @item = Item.find_by(id: params[:id])
  end 

  def edit 
    @item = Item.find_by(id: params[:id])
  end 
end 