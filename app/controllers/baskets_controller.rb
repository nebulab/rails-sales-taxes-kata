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
    @basket = build_goods(Basket.new(sales_taxes: 0, total: 0))
    @basket.save
    redirect_to basket_path(@basket.id)
  end

  private

  def build_goods(basket)
    entries = basket.handle_file(params[:file])
    entries.each do |entry|
      info = entry.split
      quantity = info[0]
      price = info[-1]
      name = info[1..-3].join
      good = basket.goods.build(name: name, price: price, quantity: quantity, basic_tax: 0, import_tax: 0)
      good.save
    end
    basket
  end
end
