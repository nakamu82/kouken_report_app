class AddUnitToSecurities < ActiveRecord::Migration[7.2]
  def change
    add_column :securities, :unit, :string
  end
end
