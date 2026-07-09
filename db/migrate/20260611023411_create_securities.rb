class CreateSecurities < ActiveRecord::Migration[7.2]
  def change
    create_table :securities do |t|
      t.string :kind
      t.string :name
      t.string :amount
      t.integer :valuation
      t.string :manager
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
