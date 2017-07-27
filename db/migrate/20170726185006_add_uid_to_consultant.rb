class AddUidToConsultant < ActiveRecord::Migration[5.1]
  def change
    add_column :consultants, :uid, :string
  end
end
