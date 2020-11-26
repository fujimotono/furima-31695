class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:create, :index]
  before_action :set_item
  before_action :move_to_index,only: [:index]
  def index
    @order_address = OrderAddress.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

    def address_params
      params.permit(:postal_code_id, :shipping_area_id, :city, :addresses, :building, :phone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

    def move_to_index
      if @item.order.present?
        redirect_to root_path
      end
    end
end