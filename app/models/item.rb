class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions do
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day
  end
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :text
    validates :image
    with_options format: {with: /\A[0-9]+\z/} do
      validates :money, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
    end
   with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_day_id
    end
  end
end
