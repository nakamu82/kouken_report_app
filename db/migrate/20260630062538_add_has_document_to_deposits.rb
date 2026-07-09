class AddHasDocumentToDeposits < ActiveRecord::Migration[7.2]
  def change
    add_column :deposits, :has_document, :boolean
  end
end
