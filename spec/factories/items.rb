FactoryBot.define do
  factory :item do
    name               {"abe"}
    price              {300}
    category_id           {2}
    product_condition_id  {2}
    shipping_charge_id    {2}
    shipping_area_id      {2}
    days_to_ship_id       {2}
    item_explain_box   {"説明"}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
