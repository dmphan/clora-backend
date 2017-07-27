class Api::V1::ProductsController < ApplicationController

  # GET /v1/products  
  def index
    render json: Product.all.order(:name)
  end
end
