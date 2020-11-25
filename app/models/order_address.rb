class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code_id, :shipping_area_id, :city, :addresses, :building, :phone_number, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code_id, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: { other_than: 1}
    validates :city
    validates :addresses
    validates :phone_number,format: { with: /\A\d{11}\z/}
    validates :token
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    Order.create(user_id: user_id, item_id: item_id)
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code_id: postal_code_id, shipping_area_id: shipping_area_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end