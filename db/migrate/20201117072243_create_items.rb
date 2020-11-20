class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string     :name
      t.integer    :price
      t.integer    :category_id
      t.integer    :product_condition_id
      t.integer    :shipping_charge_id
      t.integer    :shipping_area_id
      t.integer    :days_to_ship_id
      t.text       :item_explain_box
      t.references :user, foreign_key: true 
      t.timestamps
    end
  end
end
