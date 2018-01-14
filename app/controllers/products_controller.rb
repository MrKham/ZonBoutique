class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :trademark

  def index
    @products = Product.all
    @trademarks = Trademark.all
  end

  def show
    product = Product.find(params[:id])
    respond_to do |format|
      format.html{}
      format.js
      format.json do
        result = {
          image_product: product.picture,
          name_product: product.name,
          size_product: product.size,
          price_product: product.price
        }
        render json: result
      end
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def trademark
      @trademark = Trademark.all
    end

    def product_params
      params.require(:product).permit(:name, :price, :size, :picture, :trademark_id)
    end
end
