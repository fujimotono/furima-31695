require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it "name,price,category_id,product_condition_id,shipping_charge_id,shipping_area_id,days_to_ship_id,item_explain_box,imageが存在すれば出品できること" do
        expect(@item).to be_valid
        end
        
      end

      context '商品出品がうまくいかないとき' do
        it "商品画像を1枚つけることが必須であること" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "nameが空では登録できないこと" do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "商品の説明が必須であること" do
          @item.item_explain_box = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item explain box can't be blank")
        end
        it "カテゴリーの情報が必須であること" do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it "商品の状態についての情報が必須であること" do
          @item.product_condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product condition can't be blank")
        end
        it "配送料の負担についての情報が必須であること" do
          @item.shipping_charge_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
        end
        it "発送元の地域についての情報が必須であること" do
          @item.shipping_area_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area can't be blank")
        end
        it "発送までの日数についての情報が必須であること" do
          @item.days_to_ship_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship can't be blank")
        end
        it "価格についての情報が必須であること" do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "価格の範囲が、¥300~¥9,999,999の間であること" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it "価格の範囲が、¥300~¥9,999,999の間であること" do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end


        it "販売価格は半角数字のみ保存可能であること" do
          @item.price = "１"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it "カテゴリーの情報にid:1が選択されている場合出品できないこと" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it "商品の状態についての情報にid:1が選択されている場合出品できないこと" do
          @item.product_condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Product condition must be other than 1")
        end
        it "配送料の負担についての情報にid:1が選択されている場合出品できないこと" do
          @item.shipping_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
        end
        it "発送元の地域についての情報にid:1が選択されている場合出品できないこと" do
          @item.shipping_area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
        end
        it "発送までの日数についての情報にid:1が選択されている場合出品できないこと" do
          @item.days_to_ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
        end
      end
    end
  end
end
