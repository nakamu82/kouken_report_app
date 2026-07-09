class CreateClaims < ActiveRecord::Migration[7.2]
  def change
    create_table :claims do |t|
      t.string :debtor_name
      t.string :content
      t.integer :amount
      t.text :note
      t.boolean :has_document
      t.date :last_checked_on
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
