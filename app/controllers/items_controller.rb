class ItemsController < ApplicationController
  before_action :login_check, only: [:new, :create,]
  before_action :set_Item, only: [:show,:destroy,:edit, :update]
 
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
  
 end

 def destroy
   if @item.destroy
     redirect_to root_path
   else
     render :new
   end
 end


 def edit
 end


 def update
   if @item.update(item_params)
     redirect_to item_path
   else
     render :edit
   end 
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

  def set_Item
    @item = Item.find(params[:id])
  end



end
