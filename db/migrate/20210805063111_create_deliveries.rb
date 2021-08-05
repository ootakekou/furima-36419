class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :city_number, null: false
      t.string :build_name
      t.string :telephone
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
