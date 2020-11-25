FactoryBot.define do
  factory :order_address do
    postal_code_id        {'123-4567'}
    shipping_area_id      {2}
    city                  {'東京都'}
    addresses             {'渋谷1ー1ー1'}
    phone_number          {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
