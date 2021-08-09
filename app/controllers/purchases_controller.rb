class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase
  before_action :sold_out_item
  before_action :set_index
  def index
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery).permit(:postal_code, :prefecture_id, :city, :city_number, :build_name, :telephone, :purchase_id).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.money,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_item
    redirect_to root_path if @item.purchase.present?
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def set_index
    redirect_to root_path if current_user == @item.user
end
