class Consultant < ApplicationRecord
  include PgSearch
  has_and_belongs_to_many :products
  geocoded_by :locality
  #after_validation :geocode, if: ->(obj){ obj.city.present? and obj.city_changed? }
  after_validation :geocode, if: ->(obj){ !obj.geocoded? }
  pg_search_scope :search_for, 
                  against: [:summary, :skills, :experience],
                  :using => {
                    :tsearch => {:normalization => 4}
                  }

  def locality
    "#{city} #{state}"
  end
end
