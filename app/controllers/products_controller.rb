class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    begin
      @product = Product.new(product_params)
      if @product.save
        flash[:success] = "O produto foi salvo"
        redirect_to products_path
      else
        flash.now[:danger] = "Houve um erro ao salvar o produto"
        render :new
      end
    rescue Exception => e
      flash.now[:danger] = "Houve um erro ao salvar o produto" << e.message
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @product.update product_params
      flash[:success] = "O produto foi atualizado"
      redirect_to products_path
    else
      flash.now[:danger] = "Houve um erro ao atualizar o produto"
      render :new
    end 
  end

  def destroy
    @product.destroy
    flash[:success] = "Produto removido com sucesso"
    redirect_to products_path
  end

  private 

  def product_params
    params.require(:product).permit(:sku, :name, :description, :quantity, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
