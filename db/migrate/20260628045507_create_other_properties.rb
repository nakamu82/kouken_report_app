class CreateOtherProperties < ActiveRecord::Migration[7.2]
  def change
    create_table :other_properties do |t|
      t.string :kind
      t.string :content
      t.integer :value
      t.text :note
      t.boolean :has_document
      t.date :last_checked_on
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
