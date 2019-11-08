class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create 
    @order = Order.new(user_id: params[:id], address_id: params[:address_id])
    cart_articles = ShoppingCartArticle.where(shopping_cart_id: session[:cart_id])

    respond_to do |format|
      total_order_price = 0
      if @order.save
        cart_articles.each do |cart_article|
          order_article = OrderArticle.new(
            order: @order,
            article: cart_article.article,
            quantity: cart_article.quantity,
            total_price: cart_article.quantity * cart_article.article.price
          )
          order_article.save!
          total_order_price += order_article.total_price
        end
        @order.update_attributes(total_price: total_order_price)
        cart_articles.destroy_all
        OrderMailer.order(@order).deliver_now
        format.html { redirect_to '/', notice: "Order was successfully created. We will sent you mail on #{current_user.email}" }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to shopping_cart_path(current_user, current_user.shopping_cart), notice: "Something went wrong" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :address_id, :total_price)
    end
end
