class OrdersController < ApplicationController
 rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_order, only: %i[ show edit update destroy ]
  
  def index
    @orders = Order.all
  end

  def show
   
    
  end

  def new
    @order=Order.new
    
   
  end

  def edit
 
    end
  

  def create
    #@order = Order.new(order_params)
    #@order.save
    #flash.notice = "The order record was created successfully."
    #redirect_to @order 
 @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def update
    if @order.update(order_params)
      flash.notice = "The order record was updated successfully."
      redirect_to @order
   else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
  
  end
end
private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:product_name,:product_count,:customer_id )
    end
  end