require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user1 = FactoryBot.create(:user)
      item = FactoryBot.create(:item,user_id: user1.id) 
      user2 = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address,item_id: item.id ,user_id: user2.id)
    end

    context '商品購入ができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'postal_code_idが空だと保存できないこと' do
        @order_address.postal_code_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'shipping_area_idが空だと保存できないこと' do
        @order_address.shipping_area_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できないこと' do
        @order_address.addresses = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_code_idにはハイフンがないと保存できないこと' do
        @order_address.postal_code_id = '-'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'phone_numberにはハイフンは不要で、11桁以内でないと登録できないこと' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "shipping_area_idが1だと購入できない" do
        @order_address.shipping_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area must be other than 1")
      end
    end
  end
end
