class CreateDeposits < ActiveRecord::Migration[7.2]
  def change
    create_table :deposits do |t|
      t.string :bank_name
      t.string :branch_name
      t.string :account_type
      t.string :account_number
      t.date :last_checked_on
      t.integer :balance
      t.string :manager
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
