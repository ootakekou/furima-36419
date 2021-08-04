class ItemsController < ApplicationController
  before_action :authenticate_user!,except: :index 

  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private
  def create_params
    params.require(:item).permit(:product_name, :category_id, :money, :text, :status_id, :delivery_fee_id, :delivery_fee_id,:prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
