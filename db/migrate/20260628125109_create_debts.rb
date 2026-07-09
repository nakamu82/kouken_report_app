class CreateDebts < ActiveRecord::Migration[7.2]
  def change
    create_table :debts do |t|
      t.string :creditor_name
      t.string :content
      t.integer :amount
      t.boolean :has_document
      t.date :last_checked_on
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
