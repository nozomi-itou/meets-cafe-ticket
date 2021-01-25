require 'rails_helper'

RSpec.describe Shop, type: :model do
  before do
    @owner = FactoryBot.create(:owner)
    @shop = FactoryBot.build(:shop, owner_id: @owner.id)
 end

  describe 'shopの登録' do

    context "shopの登録ができる場合" do
      it "必要な情報を適切に入力すると、shopの登録ができる" do
        expect(@shop).to be_valid
      end
    end

    context "shopの登録ができない場合" do
      it "shop_nameが空では登録できないこと" do
        @shop.shop_name = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Shop name can't be blank")
      end

      it "shop画像が無いと登録できない" do
        @shop.image = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Image can't be blank")
      end

      it "住所が無いと登録できない" do
        @shop.address = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号がないと登録できない" do
        @shop.phone = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Phone can't be blank")
      end
      it "電話番号にハイフンがないと登録できない" do
        @shop.phone = '09012345678'
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Phone is invalid. Include hyphen(-)")
      end
      it '電話番号が全角数字だと保存できない' do
        @shop.phone = '０９０１２３４５６７８'
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Phone is invalid. Include hyphen(-)")
      end
      it '電話番号が14桁以上だと保存できない' do
        @shop.phone = '12345678901234'
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Phone is too long (maximum is 13 characters)")
      end
      it '電話番号が英数混合だと保存できない' do
        @shop.phone = '090-abcd-efgh'
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Phone is invalid. Include hyphen(-)")
      end

      it "営業時間の情報がないと登録できない" do
        @shop.open_close = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Open close can't be blank")
      end

      it "選べるドリンクの情報がないと登録できない" do
        @shop.drink = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Drink can't be blank")
      end

      it "area情報を(1以外)選択しないと登録できない" do
        @shop.area_id = 1
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Area must be other than 1")
      end

      it 'ownerが紐付いていないと保存できないこと' do
        @shop.owner = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Owner must exist")
      end
    end
  end
end
