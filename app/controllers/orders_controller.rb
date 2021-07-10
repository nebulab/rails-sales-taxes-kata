class OrdersController < ApplicationController
  def index; end

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
end