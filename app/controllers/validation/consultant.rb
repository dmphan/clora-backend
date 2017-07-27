module Validation
  class Consultant
    include ActiveModel::Validations

    attr_accessor :locality, :experiences, :products

    validates :locality, presence: true
    validates :experiences, presence: true
    validates :products, presence: true
 
    def initialize(params={})
      @locality  = params[:locality]
      @experiences = params[:experiences]
      @products = params[:products]
    end
  end
end
