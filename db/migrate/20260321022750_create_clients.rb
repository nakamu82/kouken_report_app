class CreateClients < ActiveRecord::Migration[7.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.date :birthdate
      t.string :address
      t.string :case_number

      t.timestamps
    end
  end
end
