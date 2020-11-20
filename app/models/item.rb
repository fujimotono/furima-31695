class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_to_ship
  
  with_options presence: true do
  validates :category
  validates :name
  validates :product_condition
  validates :shipping_charge
  validates :shipping_area
  validates :days_to_ship
  validates :item_explain_box
  validates :image
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price
  end
  validates_inclusion_of :price, in: 300..9_999_999
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end
  
end
