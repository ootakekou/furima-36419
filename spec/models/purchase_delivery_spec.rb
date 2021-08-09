require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@purchase_delivery).to be_valid
      end

      it 'build_nameは空でも保存できること' do
        @purchase_delivery.build_name = ' '
        expect(@purchase_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @purchase_delivery.postal_code = ' '
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_delivery.postal_code = '123=4567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空だと保存できないこと' do
        @purchase_delivery.prefecture_id = ' '
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1だと登録できない' do
        @purchase_delivery.prefecture_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが空だと保存できないこと' do
        @purchase_delivery.city = ' '
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("City can't be blank")
      end

      it 'city_numberが空だと保存できないこと' do
        @purchase_delivery.city_number = ' '
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("City number can't be blank")
      end

      it 'telephoneが空だと保存できないこと' do
        @purchase_delivery.telephone = ' '
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Telephone can't be blank")
      end

      it 'telephoneは10以下の数字だと保存できないこと' do
        @purchase_delivery.telephone = '123456789'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Telephone is invalid')
      end

      it 'telephoneは11以上の数字だと保存できないこと' do
        @purchase_delivery.telephone = '123456789012'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Telephone is invalid')
      end

      it 'tokenが空だと保存できないこと' do
        @purchase_delivery.token = ' '
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'userと紐づいていないと保存できないこと' do
        @purchase_delivery.user_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと保存できないこと' do
        @purchase_delivery.item_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end

      it 'telephoneに数字意外が入っていると保存できないこと' do
        @purchase_delivery.telephone = '123456abcde'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Telephone is invalid")
      end

      it 'postal_codeのハイフンがないと保存できないこと' do
        @purchase_delivery.postal_code = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
    end
  end
end
