class ItemsController < ApplicationController
  before_action :find_item, only:  [:show, :edit, :update, :destroy]
  def index
    @items = Item.order('items.created_at DESC')

  end

  def admin
    

  end

  def show
    find_item
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def edit
   @item = Item.find(params[:id])
  end

  def update
    @items.update(item_params)
    redirect_to @items
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to item_url
  end


private
  def find_item
   @items = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item)
  end
end
