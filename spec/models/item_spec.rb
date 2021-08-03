require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品登録ができるとき' do
   it 'product_nameとtextとmoneyとcategory_idとstatus_idとdelivery_fee_idとprefecture_idとshipping_day_idとimageとuserが存在すれば登録できる' do
    expect(@item).to be_valid
      end
    end
    context '商品出品登録ができないとき' do
    it 'product_nameが空では登録できない' do
    @item.product_name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Product name can't be blank")
     end  

     it 'textが空では登録できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
     end

     it 'moneyが空だと登録できない' do
       @item.money = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Money can't be blank", "Money is invalid", "Money is out of setting range")
     end

     it 'moneyが300円以下の場合は登録できない' do
       @item.money = 299
       @item.valid?
       expect(@item.errors.full_messages).to include("Money is out of setting range")
     end

     it 'moneyが9999999以上の場合は登録できない' do
       @item.money = 10000000
       @item.valid?
       expect(@item.errors.full_messages).to include("Money is out of setting range")
     end

     it 'category_idが空だと登録できない' do
       @item.category_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
     end

     it 'category_idの:idが1だと登録できない' do
       @item.category_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Category must be other than 1")
     end

     it 'status_idが空だと登録できない' do
       @item.status_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number") 
     end

     it 'status_idの:idが1だと登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
     end

     it 'delivery_fee_idが空だと登録できない' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank", "Delivery fee is not a number") 
    end
    
     it 'delivery_fee_idの:idが1だと登録できない' do
       @item.delivery_fee_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
     end

     it 'prefecture_idが空だと登録できない' do
       @item.prefecture_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
     end

     it 'prefecture_idの:idが1だと登録できない' do
       @item.prefecture_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
     end

     it 'shipping_day_idが空だと登録できない' do
       @item.shipping_day_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping day can't be blank", "Shipping day is not a number")
     end

     it 'shipping_day_idの:idが1だと登録できない' do
       @item.shipping_day_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
     end

     it 'imageが空だと登録できない' do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
     end

     it 'userが紐付いてないと登録できない' do
       @item.user = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("User must exist")
     end
    end
   end
end
