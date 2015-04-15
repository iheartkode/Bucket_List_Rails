class ItemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :find_item, only:  [:show, :edit, :update, :destroy]

  def index
    @item = Item.where(user_id: current_user).order('items.created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
       flash[:success] = "Item was successfully created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
     flash[:success] = "Item was successfully updated"
    redirect_to root_path
  end

  def destroy
    @item.destroy
    flash[:success] = "The item was successfully deleted"
    redirect_to root_path
  end


private
  def find_item
  @item = Item.find(params[:id])
  end

  def item_params
  params.require(:item).permit(:item)
  end
end
