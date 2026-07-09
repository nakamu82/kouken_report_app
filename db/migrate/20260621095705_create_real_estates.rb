class CreateRealEstates < ActiveRecord::Migration[7.2]
  def change
    create_table :real_estates do |t|
      t.string :estate_type
      t.string :address
      t.string :lot_number
      t.string :land_category
      t.float :area
      t.string :building_number
      t.string :building_kind
      t.float :floor_area
      t.text :note
      t.boolean :has_document
      t.date :last_checked_on
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
