class CreateConsultantsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :consultants_products do |t|
      t.belongs_to :consultant, index: true
      t.belongs_to :product, index: true
    end
  end
end
