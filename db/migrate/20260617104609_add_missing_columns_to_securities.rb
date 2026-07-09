class AddMissingColumnsToSecurities < ActiveRecord::Migration[7.2]
  def change
    add_column :securities, :quantity, :decimal, precision: 15, scale: 2
    add_column :securities, :face_value, :decimal, precision: 15, scale: 2
    add_column :securities, :has_document, :boolean, default: false
  end
end
