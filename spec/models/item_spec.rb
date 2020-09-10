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
        it "day_standard_idが空だと登録できない" do
          @item.day_standard_id = ""
          @item.category_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Day standard can't be blank", "Day standard is not a number", )       
        end
        it "category_idが空だと登録できない"do
        @item.category_id = ""
        @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
        end
        it "delivery_fee_idが空だと登録できない" do
          @item.delivery_fee_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank","Delivery fee is not a number")
        end
        it "status_idが空だと登録できない"do
          @item.status_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include( "Status can't be blank", "Status is not a number")
        end
        it "area_idとstatus_idのidが0だと登録できない" do
          @item.area_id = "0"          
          @item.valid?
          expect(@item.errors.full_messages).to include("Area must be other than 0")
        end
        it "day_standard_idのidが0だと登録できない"do
          @item.day_standard_id = "0"
          @item.valid?
          expect(@item.errors.full_messages).to include("Day standard must be other than 0")
        end
        it "category_idのidが0だと登録できない"do
          @item.category_id = "0"
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 0")
        end
          it "delivery_fee_idのidが0だと登録できない"do
          @item.delivery_fee_id = "0"
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee must be other than 0")
        end
        it "status_idのidが0だと登録できない"do
        @item.status_id = "0"
        @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 0")
        end
        it "priceが300から10000000の間でなくては保存できない" do
          @item.price = "200"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than 300")
        end 
        it "priceが300から10000000の間でなくては保存できない" do
          @item.price = "200"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than 300")
        end
        it "priceが300から10000000の間でなくては保存できない" do
          @item.price = "10000000"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 10000000")
        end
      end
    end
  end
end

