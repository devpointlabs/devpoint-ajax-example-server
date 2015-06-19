class Api::V1::ProductsController < ApplicationController
  before_action :find_product, only: [:show, :update, :destroy]

  def index
    respond_to do |format|
      format.json { render json: {products: Product.all} }
    end
  end

  def show
    respond_to do |format|
      if @product
        format.json { render json: {product: @product} }
      else
        format.json { render json: {message: "Product not found with ID: #{params[:id]}"}, status: 404 }
      end
    end
  end

  def create
    respond_to do |format|
      product = Product.create(product_params)
      if product.persisted?
         format.json { render json: {product: product}, status: 201 }
      else
         format.json { render json: {message: "Product was NOT created successfully: #{product.errors.full_messages.join(' and ')}"}, status: 400  }
      end
    end
  end

  def update
    respond_to do |format|
      if @product
        if @product.update(product_params)
          format.json { render json: {product: @product.reload} }
        else
          format.json { render json: {message: "Product was NOT updated successfully: #{@product.errors.full_messages.join(' and ')}"}, status: 400  }
        end
      else
         format.json { render json: {message: "Product not found with ID: #{params[:id]}"}, status: 404 }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @product
        name = @product.name
        @product.destroy
         format.json { render json: {message: "Product with name: #{name} destroyed successfully."} }
      else
        format.json { render json: {message: "Product not found with ID: #{params[:id]}"}, status: 404 }
      end
    end
  end

  private
    def find_product
      @product = Product.find_by(id: params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :base_price, :description, :quanity_on_hand, :color, :weight, other_attributes: [])
    end
end