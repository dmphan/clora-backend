class CreateConsultants < ActiveRecord::Migration[5.1]
  def change
    create_table :consultants do |t|
      t.string :given_name
      t.string :family_name
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude
      t.string :linkedin_uri
      t.text :summary
      t.json :experience
      t.text :skills
      t.timestamps
    end
  end
end
