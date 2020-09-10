require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品がうまくいくとき' do
    context '商品が出品できるとき' do
      it "nameとprice、textとarea、day_standardとcategory、delivery_feeとstatus、imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      

      context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
        end
        it "nicknameが7文字以上であれば登録できない" do
        end
        it "emailが空では登録できない" do
        end
        it "重複したemailが存在する場合登録できない" do
        end
        it "passwordが空では登録できない" do
        end
        it "passwordが5文字以下であれば登録できない" do
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
       end
      end
    end
  end
end

