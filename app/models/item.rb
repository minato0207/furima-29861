class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :area
  belongs_to_active_hash :day_standard
  belongs_to_active_hash :delivery_fee
  has_one_attached :image

  validates :name, :price, :text, :area, :day_standard, :category, :delivery_fee, :status, :image, presence: true
  validates :area_id, :day_standard_id, :category_id, :delivery_fee_id, :status_id, numericality: { other_than: 0 } 
  validates  :price, numericality: { only_integer: true, greater_than: 300, less_than: 10000000 } 

  with_options presence: true, format: { with: /\A[0-9]+\z/ , message: '半角数字を使用してください'} do
    validates :price
  end
  




  belongs_to :user
end

