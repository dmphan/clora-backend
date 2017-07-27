FactoryGirl.define do
  factory :consultant do
    given_name 'Paige'
    family_name 'Cary'
    city 'Boston'
    state 'MA'
    latitude 42.3600825
    longitude -71.0588801
    linkedin_uri 'http://example.com'
    summary "CMC"
    experience "FDA"
    uid '23ds92'
  end
end