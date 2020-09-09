class ItemsController < ApplicationController
 def index
   @items = Item.all
 end

 def new
   @item = Item.new
 end

 def create
  Item.create(item_params)
 end




 private

 def item_params
   params.require(:item).permit(:name, :price, :image, :text, :area_id, :day_standard_id, :category_id, :delivery_fee_id, :status_id,).merge(user_id: current_user.id)
 end



end
