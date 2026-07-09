class CreateInheritanceProperties < ActiveRecord::Migration[7.2]
  def change
    create_table :inheritance_properties do |t|
      t.string :status
      t.date :last_checked_on
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
