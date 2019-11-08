class ArticlesController < ApplicationController
  before_action :require_user
  before_action :require_admin_user, except: [:show, :index, :add_to_cart, :remove_from_cart, :decrease_from_cart]
  before_action :set_article, only: [:show, :edit, :update, :destroy, :add_to_cart, :remove_from_cart, :decrease_from_cart]
  # GET /articles
  # GET /articles.json
  def index
    if params[:filter] && params[:filter][:search]
      @articles = Article.search_by_name(params[:filter][:search])
    else
      @articles = Article.all
    end

    if params[:filter] && params[:filter][:max_value]
      @articles = @articles.where('price < ?', params[:filter][:max_value])
    end

    if params[:filter] && params[:filter][:min_value]
      @articles = @articles.where('price > ?', params[:filter][:min_value])
    end
    @articles = @articles.paginate(page: params[:page], per_page: 12)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save!
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_cart
    cart = ShoppingCart.find(session[:cart_id])
    cart_article = ShoppingCartArticle.find_or_initialize_by(article: @article, shopping_cart: cart)
    quantity = params[:quantity] ? params[:quantity].to_i : 1

    if !cart_article.new_record?
      cart_article.quantity += quantity
    end
    cart_article.save!
    redirect_to shopping_cart_path(current_user, cart)
  end

  def decrease_from_cart
    cart = ShoppingCart.find(session[:cart_id])
    cart_article = ShoppingCartArticle.find_or_initialize_by(article: @article, shopping_cart: cart)
    cart_article.quantity -= 1 if cart_article.quantity > 1
    cart_article.save
    redirect_to shopping_cart_path(current_user, cart)
  end

  def remove_from_cart
    cart = ShoppingCart.find(session[:cart_id])
    ShoppingCartArticle.where(article: @article, shopping_cart: cart).destroy_all
    redirect_to shopping_cart_path(current_user, cart)
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    ShoppingCartArticle.where(article: @article).destroy_all
    @article.delete
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:name, :description, :price, :image_url, :weight, :user_id)
  end
end
