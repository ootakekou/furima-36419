class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :city_number, :build_name, :telephone, :purchase_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :city_number
    validates :telephone, format: {with: /\A\d{10,11}\z/}
    validates :token
  end
    def save
      purchase = Purchase.create(item_id: item_id, user_id: user_id)
  
      Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, city_number: city_number, build_name: build_name, telephone: telephone, purchase_id: purchase.id)

    end
  
end