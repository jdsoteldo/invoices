class AddIdToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :business_id, :integer
  end
end
