class AddFacilityNameToDeposits < ActiveRecord::Migration[7.2]
  def change
    add_column :deposits, :facility_name, :string
  end
end
