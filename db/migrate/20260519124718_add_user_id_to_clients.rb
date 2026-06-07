class AddUserIdToClients < ActiveRecord::Migration[7.2]
  def change
    add_reference :clients, :user, foreign_key: true
  end
end
