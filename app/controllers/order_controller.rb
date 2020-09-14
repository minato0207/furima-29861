class OrderController < ApplicationController
  before_action :login_check, only:[:index]
  before_action :set_order 
 
 def index
 end

 def create
 end



 private

 def login_check
   unless user_signed_in?
     redirect_to root_path
   end

  end


 def set_order
   @item = Item.find(params[:item_id])
 end


 
end
