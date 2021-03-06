class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        Product.create(product_params)
        redirect_to products_path
    end

    def description
        render plain: Product.find(params[:id]).description
    end

    def inventory
        render plain: (Product.find(params[:id]).inventory > 0)
    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :description, :inventory)
    end
end
