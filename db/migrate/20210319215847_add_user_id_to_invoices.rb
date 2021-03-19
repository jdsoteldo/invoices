class AddUserIdToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :user_id, :integer
  end
end
