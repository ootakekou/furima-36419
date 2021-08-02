require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_kanaとlast_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上且つ英数字含まれていれば登録できる' do
        @user.password = 'ko0000'
        @user.password_confirmation = 'ko0000'
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  
    it 'passwordが空だと登録できない' do
      @user.password = '' 
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid")
    end

    it 'パスワードが6文字以下且つ半角英数字含まれていないと登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is invalid")
    end
   
    it '重複してるemailがあると登録できない' do
     @user.save
     another_user = FactoryBot.build(:user)
     another_user.email = @user.email
     another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordに英数字が含まれていないと登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end

    it 'first_nameに英数字と記号があると登録できない' do
      @user.first_name = '山田y1'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end

    it 'last_nameに英数字と記号があると登録できない' do
      @user.last_name = '大郎t1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'first_kanaが空だと登録できない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank", "First kana is invalid")
    end

    it 'first_kanaがカタカナでないと登録できない' do
      @user.first_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana is invalid")
    end

    it 'last_kanaが空だと登録できない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank", "Last kana is invalid")
    end

    it 'last_kanaがカタカナでないと登録できない' do
      @user.last_kana = '大郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana is invalid")
    end

    it 'birthdayが空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
 end
end