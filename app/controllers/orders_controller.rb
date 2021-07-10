# frozen_string_literal: true

class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_order, only: %i[show destroy]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    BasketReader.read_basket(params[:order][:basket_items_file]).each do |line_item|
      @order.line_items << line_item
    end

    if @order.save
      @order.update_totals
      redirect_to order_path(@order.id)
    else
      flash[:failure] = @order.errors.full_messages.to_s
      redirect_to new_order_path
    end
  end

  def show; end

  def destroy
    @order.destroy
    redirect_to new_order_path, notice: 'Order was successfully destroyed.'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
