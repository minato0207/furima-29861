class ItemsController < ApplicationController
  before_action :login_check, only: [:new, :create]
 
 def index
   @items = Item.all.order("created_at DESC")
 end

 def new
   @item = Item.new
 end

 def create
   @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new 
    end
 end

 def show
   @item = Item.find(params[:id])
 end




 private

 def item_params
   params.require(:item).permit(:name, :price, :image, :text, :area_id, :day_standard_id, :category_id, :delivery_fee_id, :status_id).merge(user_id: current_user.id)
 end

  def login_check
   unless user_signed_in?
      redirect_to root_path
    end
  end



end
