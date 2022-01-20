class BasketsController < ApplicationController
  def index
    @baskets = Basket.all
  end

  def show
    @basket = Basket.find(params[:id])
  end

  def new
    @basket = Basket.new
  end

  def create
    @basket = helpers.build_goods(Basket.new(sales_taxes: 0, total: 0))
    @basket.save
    redirect_to basket_path(@basket.id)
  end
end
