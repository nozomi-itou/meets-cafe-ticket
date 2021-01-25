require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context "登録ができる場合" do
      it "必要な情報を適切に入力すると、ユーザー登録ができる" do
        expect(@user).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @user.building_name = nil
        expect(@user).to be_valid
      end
    end

    context "登録できない場合" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれてなければ登録できない' do
        @user.email = "ppppppp"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "半角英語のみは登録できない" do
        @user.password = "wwwwww"
        @user.password_confirmation = "wwwwww"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "数字のみは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "全角英数混合は登録できない" do
        @user.password = "１１１ＡＡＡ"
        @user.password_confirmation = "１１１ＡＡＡ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "誕生日が空の場合は登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "姓が空の場合は登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "姓が全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.last_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "名が空の場合は登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名が全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "姓(カナ)が空の場合は登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "姓(カナ)が全角（カタカナ）以外は登録できない" do
        @user.last_name_kana = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "名(カナ)が空の場合は登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "名(カナ)が全角（カタカナ）以外は登録できない" do
        @user.first_name_kana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it 'genderを(1以外を)選択していないと保存できない' do
        @user.gender_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Gender must be other than 1")
      end

      it 'areaを(1以外を)選択していないと保存できない' do
        @user.area_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Area must be other than 1")
      end

      it 'cityが空だと保存できない' do
        @user.city = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("City can't be blank")
      end

      it "cityが全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.city = 'ﾖｺﾊﾏｼ'
        @user.valid?
        expect(@user.errors.full_messages).to include("City is invalid. Input full-width characters.")
      end

      it 'addressが空だと保存できない' do
        @user.address = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Address can't be blank")
      end

  
      it 'phone_numberが空だと保存できない' do
        @user.phone_number = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角数字だと保存できない' do
        @user.phone_number = '０９０１２３４５６７８'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'phone_numberが12桁以上だと保存できない' do
        @user.phone_number = '123456789012'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'phone_numberが英数混合だと保存できない' do
        @user.phone_number = '090abcdefgh'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number is invalid.")
      end

    end
  end
end
