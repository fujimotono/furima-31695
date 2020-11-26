class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :addresses, :building, :phone_number, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: { other_than: 1}
    validates :city
    validates :addresses
    validates :phone_number,format: { with: /\A\d{11}\z/}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end