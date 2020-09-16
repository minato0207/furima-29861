require 'rails_helper'
RSpec.describe AdrressOrder, type: :model do
  describe "購入機能の住所保存" do
    before do
      @adrress_order = FactoryBot.build(:adrress_order)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@adrress_order).to be_valid
    end
    it 'buildnameがなくても保存できる' do
      @adrress_order.build_name = nil
      expect(@adrress_order).to be_valid
    end
    it 'zipが空だと保存できないこと' do
      @adrress_order.zip = nil
      @adrress_order.valid?
      expect(@adrress_order.errors.full_messages).to include("Zip can't be blank", "Zip is invalid. Include hyphen(-)")
    end
    it 'zipにハイフンがないと保存できないこと' do
      @adrress_order.zip = "1234567"
      @adrress_order.valid?
      expect(@adrress_order.errors.full_messages).to include("Zip is invalid. Include hyphen(-)")
    end
    it 'area_idが空だと保存できないこと' do
      @adrress_order.area_id = nil
      @adrress_order.valid?
      expect(@adrress_order.errors.full_messages).to include("Area can't be blank", "Area can't be blank")
    end
    it 'area_idが---だと保存できないこと' do
      @adrress_order.area_id = 0
      @adrress_order.valid?
      expect(@adrress_order.errors.full_messages).to include("Area can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @adrress_order.city = nil
      @adrress_order.valid?
      expect(@adrress_order.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @adrress_order.address = nil
      @adrress_order.valid?
      expect(@adrress_order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_callが空だと保存できないこと' do
      @adrress_order.phone_call = nil
      @adrress_order.valid?
      expect(@adrress_order.errors.full_messages).to include("Phone call can't be blank", "Phone call is invalid")
    end
    it 'phonecallにハイフンがあると保存できないこと' do
      @adrress_order.phone_call = "123-4567-8910"
      @adrress_order.valid?
      expect(@adrress_order.errors.full_messages).to include("Phone call is invalid")
    end
    it 'phonecallが12桁以上と保存できないこと' do
      @adrress_order.phone_call = "12345678890123"
      @adrress_order.valid?
      expect(@adrress_order.errors.full_messages).to include("Phone call is invalid")
    end
    it 'tokenがないと購入出来ない'do
      @adrress_order.token = ""
      @adrress_order.valid?
      expect(@adrress_order.errors.full_messages).to include("Token can't be blank")
    end

  end
end