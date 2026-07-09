class AddMonthlyPaymentToDebts < ActiveRecord::Migration[7.2]
  def change
    add_column :debts, :monthly_payment, :integer
  end
end
