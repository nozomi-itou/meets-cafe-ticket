require 'rails_helper'

RSpec.describe Owner, type: :model do
  before do
    @owner = FactoryBot.build(:owner)
  end

  describe 'オーナー登録' do
    context "登録ができる場合" do
      it "必要な情報を適切に入力すると、オーナー登録ができる" do
        expect(@owner).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @owner.building_name = nil
        expect(@owner).to be_valid
      end
    end

    context "登録できない場合" do
      it "emailが空では登録できない" do
        @owner.email = ""
        @owner.valid?
        expect(@owner.errors.full_messages).to include "Email can't be blank"
      end
      it "passwordが空だと登録できない" do
        @owner.password = ""
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @owner.password_confirmation = ""
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @owner.password = "123456"
        @owner.password_confirmation = "1234567"
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @owner.save
        another_owner = FactoryBot.build(:owner)
        another_owner.email = @owner.email
        another_owner.valid?
        expect(another_owner.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれてなければ登録できない' do
        @owner.email = "ppppppp"
        @owner.valid?
        expect(@owner.errors.full_messages).to include ("Email is invalid")
      end
      it "passwordが5文字以下では登録できない" do
        @owner.password = "00000"
        @owner.password_confirmation = "00000"
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "半角英語のみは登録できない" do
        @owner.password = "wwwwww"
        @owner.password_confirmation = "wwwwww"
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password is invalid")
      end
      it "数字のみは登録できない" do
        @owner.password = "123456"
        @owner.password_confirmation = "123456"
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password is invalid")
      end
      it "全角英数混合は登録できない" do
        @owner.password = "１１１ＡＡＡ"
        @owner.password_confirmation = "１１１ＡＡＡ"
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password is invalid")
      end
      it "誕生日が空の場合は登録できない" do
        @owner.birthday = ""
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Birthday can't be blank")
      end
      it "姓が空の場合は登録できない" do
        @owner.last_name = ""
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Last name can't be blank")
      end
      it "姓が全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @owner.last_name = "ﾔﾏﾀﾞ"
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Last name is invalid")
      end
      it "名が空の場合は登録できない" do
        @owner.first_name = ""
        @owner.valid?
        expect(@owner.errors.full_messages).to include("First name can't be blank")
      end
      it "名が全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @owner.first_name = "ﾀﾛｳ"
        @owner.valid?
        expect(@owner.errors.full_messages).to include("First name is invalid")
      end
      it "姓(カナ)が空の場合は登録できない" do
        @owner.last_name_kana = ""
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "姓(カナ)が全角（カタカナ）以外は登録できない" do
        @owner.last_name_kana = "ﾔﾏﾀﾞ"
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Last name kana is invalid")
      end
      it "名(カナ)が空の場合は登録できない" do
        @owner.first_name_kana = ""
        @owner.valid?
        expect(@owner.errors.full_messages).to include("First name kana can't be blank")
      end
      it "名(カナ)が全角（カタカナ）以外は登録できない" do
        @owner.first_name_kana = "ﾀﾛｳ"
        @owner.valid?
        expect(@owner.errors.full_messages).to include("First name kana is invalid")
      end

      it 'post_codeが空だと保存できない' do
        @owner.post_code = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Post code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @owner.post_code = '1234567'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'areaを(1以外を)選択していないと保存できない' do
        @owner.area_id = 1
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Area must be other than 1")
      end

      it 'cityが空だと保存できない' do
        @owner.city = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include("City can't be blank")
      end

      it "cityが全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @owner.city = 'ﾖｺﾊﾏｼ'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("City is invalid. Input full-width characters.")
      end

      it 'addressが空だと保存できない' do
        @owner.address = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Address can't be blank")
      end

  
      it 'phone_numberが空だと保存できない' do
        @owner.phone_number = nil
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角数字だと保存できない' do
        @owner.phone_number = '０９０１２３４５６７８'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @owner.phone_number = '123456789012'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'phone_numberが英数混合だと保存できない' do
        @owner.phone_number = '090abcdefgh'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Phone number is invalid.")
      end
    end
  end
end
