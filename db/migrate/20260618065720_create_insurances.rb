class CreateInsurances < ActiveRecord::Migration[7.2]
  def change
    create_table :insurances do |t|
      t.string :insurance_company
      t.string :insurance_kind
      t.string :policy_number
      t.decimal :amount
      t.string :contractor
      t.string :beneficiary
      t.boolean :has_document
      t.date :last_checked_on
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
