class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :category
  belongs_to :status_id
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :money
    validates :text
   with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_day_id
    end
  # with_options foreign_key: true do
   # validates :user
   # end
  end
end
