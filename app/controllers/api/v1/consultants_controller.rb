module Api::V1
  class ConsultantsController < ApplicationController
    before_action :validate_params

    # GET /v1/consultants
    # required params: locality, experiences, products
    def index
      stopwords = ['by', 'written', 'from', 'manage', 'has', 'experience', 'familiarity', 'prior', 'with', 'former', 'for', 'to', 'been', 'responsible', 'run', 'complex', 'in', 'an', 'strong', 'experience', 'plans']
      filter = Stopwords::Filter.new stopwords
      search_terms = []
      
      # params[:experiences] is a free-form textarea
      # where experiences are comma separated
      experiences = params[:experiences].split(",")
      experiences.each do |exp|
        filtered = filter.filter exp.split 
        search_terms.concat filtered 
      end
      
      @consultants = Consultant.includes(:products).near(params[:locality]).search_for(search_terms.join(" "))
      #@consultants = Consultant.near(params[:locality]).joins(:products).where(products: {id: params[:products]}).search_for(search_terms.join(" "))
      render json: @consultants 
    end
  end
end
