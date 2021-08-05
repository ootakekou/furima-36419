class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show] 
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]
  def index
    @items = Item.order("created_at DESC").includes(:user)
  end
  
  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(create_params)
      redirect_to item_path
    else
      render :edit
    end
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

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless @item.user_id == current_user.id
      redirect_to root_path(@item)
    end
  end

end
