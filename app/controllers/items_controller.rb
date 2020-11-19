class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    #binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :price, :category_id, :product_condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, :item_explain_box, :image).merge(user_id: current_user.id)
    end
  end
