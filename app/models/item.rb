class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :product_name
    validates :text
    validates :image
    with_options format: { with: /\A[0-9]+\z/ } do
      validates :money,
                numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                message: 'is out of setting range' }
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
