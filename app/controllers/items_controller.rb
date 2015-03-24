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
      redirect_to @item
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
        redirect_to @items
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    flash[:success] = "User deleted"
    redirect_to @item
  end


private
def find_item
  @item = Item.find(params[:id])
end

def item_params
  params.require(:item).permit(:item)
  end
end
