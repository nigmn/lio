class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def done
    Order.update(params[:id].to_i, status: 'Доставлен')
	redirect_to :back
  end

  def cancel
	Order.update(params[:id].to_i, status: 'Отменен')
	redirect_to :back
  end

  def view_orders
    if is_admin?
	  @orders = Order.all
	else
	  redirect_to root_url, notice: "Нет прав администратора"
	end
  end

  def add
    status = "В обработке"
    user_id = current_user.id
    products = Product.all
    content = " "
    total = 0
    products.each_with_index do |x, i|
      if params["val#{i}"] != ""
        total += ( x.price * params["val#{i}"].to_i )
        content.concat("#{x.name} ")
      end
    end
    order = Order.new(user_id: user_id, total: total, content: content, status: status)
    if order.save
	  redirect_to "/users/show/#{session[:current_user_id]}", notice: 'Заказ сформирован'
	else
	  redirect_to "/users/show/#{session[:current_user_id]}", notice: 'Ошибка!'
	end
  end

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    if is_admin?
      @product = Product.new
	else
	  redirect_to root_url, notice: 'Нет полномочий администратора'
	end
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    if is_admin?
      @product = Product.new(product_params)

      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: 'Товар был добавлен' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
	  end
	else
	  redirect_to root_url, notice: 'Нет полномочий администратора'
	end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if is_admin?
		respond_to do |format|
		  if @product.update(product_params)
			format.html { redirect_to @product, notice: 'Товар был изменен' }
			format.json { render :show, status: :ok, location: @product }
		  else
			format.html { render :edit }
			format.json { render json: @product.errors, status: :unprocessable_entity }
		  end
		end
    else
	  redirect_to root_url, notice: 'Нет полномочий администратора'
	end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    if is_admin?
		@product.destroy
		respond_to do |format|
		  format.html { redirect_to products_url, notice: 'Товар удален' }
		  format.json { head :no_content }
		end
    else
	  redirect_to root_url, notice: 'Нет полномочий администратора'
	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :about, :img, :price)
    end
end
