class AdrressOrder
  attr_accessor :token
  include ActiveModel::Model
  attr_accessor :zip, :area_id,:city,:address,:build_name,:phone_call,:token,:user_id, :item_id
  with_options presence: true do
    validates :phone_call, format: {with: /\A\d{10,11}\z/}
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city, :address

  end



    def save
      order = Order.create( user_id: user_id, item_id: item_id)
    end
end