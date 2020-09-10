require 'rails_helper'
describe Item do
 before do
    @item = FactoryBot.build(:item)
 end

  describe '商品出品がうまくいくとき' do
    context '商品が出品できるとき' do
      it "nameとprice、textとarea、day_standard_idとcategory_id、delivery_fee_idとstatus_id、imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end

      
  
      context '商品出品がうまくいかないとき' do
        it "nameが空だと登録できない" do
          @item.name = ""
          @item.valid?
         expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "priceが空だと登録できない" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank") 
        end
        it "areaが空だと登録できない" do
          @item.area_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
        end
        it "day_standard_idとcategory_idが空だと登録できない" do
          @item.day_standard_id = ""
          @item.category_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Day standard can't be blank", "Category can't be blank", "Day standard is not a number", "Category is not a number")
        end
        it "delivery_fee_idとstatus_idが空だと登録できない" do
          @item.delivery_fee_id = ""
          @item.status_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank", "Status can't be blank", "Delivery fee is not a number", "Status is not a number")
        end
        it "area_idとday_standard_idとcategory_id, delivery_fee_idとstatus_idのidが0だと登録できない" do
          @item.area_id = "0"
          @item.day_standard_id = "0"
          @item.category_id = "0"
          @item.delivery_fee_id = "0"
          @item.status_id = "0"
          @item.valid?
          expect(@item.errors.full_messages).to include("Area must be other than 0",
            "Day standard must be other than 0",
            "Category must be other than 0",
            "Delivery fee must be other than 0",
            "Status must be other than 0")
        end
        it "priceが300から10000000の間でなくては保存できない" do
          @item.price = "200"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than 300")
        end 
      end
    end
  end

end

