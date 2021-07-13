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

  # "basket_data" => #<ActionDispatch::Http::UploadedFile:0x00007fd5f4492da8 @tempfile=#<Tempfile:/var/folders/xf/vn3k5k_x71397x8q9hd_ctlr0000gn/T/RackMultipart20210713-17263-1ph9nlw.txt>, @original_filename="basket_1.txt", @content_type="text/plain", @headers="Content-Disposition: form-data; name=\"basket_data\"; filename=\"basket_1.txt\"\r\nContent-Type: text/plain\r\n">, "button"=>"", "controller"=>"orders", "action"=>"upload"} permitted: false>

    private

  def set_order
    @order = Order.find(params[:id])
  end
end