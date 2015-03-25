class ItemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :find_item, only:  [:show, :edit, :update, :destroy]

  def index
    @item = Item.where(user_id: current_user).order('items.created_at DESC')
  end

  def show
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
      flash[:success] = "Item was successfully created."
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
    redirect_to root_path
  end

  def destroy
    @item.destroy
    flash[:success] = "Item was deleted"
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
