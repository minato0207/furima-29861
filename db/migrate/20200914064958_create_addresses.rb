class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :build_name 
      t.string :phone_call, null: false
      t.integer :order_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
