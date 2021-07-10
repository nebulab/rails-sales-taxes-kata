class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def index
    @orders = Order.all
  end

  def show; end

  def upload
    begin
      @order = Order.new.import(params[:basket_data])
      redirect_to @order
    rescue => e
      flash[:error] = e.message
      redirect_to root_path
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end