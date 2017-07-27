class ApplicationController < ActionController::API
  
  def validate_params
    validation = Validation::Consultant.new(params)
    if !validation.valid?
      render json: { error: validation.errors }, status: 422
    end
  end
end
