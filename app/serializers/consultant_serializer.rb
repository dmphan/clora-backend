class ConsultantSerializer < ActiveModel::Serializer
  attributes :uid, :given_name, :family_name, :linkedin_uri, :locality, :products
end
