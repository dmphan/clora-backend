class Product < ApplicationRecord
  has_and_belongs_to_many :consultants

  def value
    id
  end

  def label
    name
  end
end
