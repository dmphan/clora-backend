require 'rails_helper'

RSpec.describe "Products API", :type => :request do
  let!(:products) { FactoryGirl.create_list(:product, 5) }

  context "with valid params" do 
    it "responds with success" do
      get '/v1/products'
      expect(response).to be_success
    end

    it "finds correct consultant" do
      get '/v1/products'
      json = JSON.parse(response.body)
      expect(json.length).to eq(5)
    end
  end

end