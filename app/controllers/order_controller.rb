class OrderController < ApplicationController
  before_action :set_item
  before_action :login_check, only:[:index]
 
 def index
  @order =AdrressOrder.new
 end

 def create
  @order = AdrressOrder.new(order_params)
  if @order.valid?
    pay_item
    @order.save
    return redirect_to root_path
  else
    render 'index'
  end
 end



 private

 def login_check
   if !user_signed_in? || current_user.id == @item.user_id
     redirect_to root_path
   end

   

  end


 def set_item
   @item = Item.find(params[:item_id])
 end

 def order_params
  params.require(:adrress_order).permit(:zip, :area_id, :city,:address, :build_name, :phone_call, :token).merge(user_id: current_user.id, item_id: @item.id)
  
 end

 def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
     amount: @item.price,  # 商品の値段
     card: params[:token],   # カードトークン
     currency:'jpy'                 # 通貨の種類(日本円)
    )
 end

 
end
