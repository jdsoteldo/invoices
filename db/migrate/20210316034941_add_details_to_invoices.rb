class AddDetailsToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :title, :string, null: false
    add_column :invoices, :services, :string
    add_column :invoices, :paid, :boolean
    add_column :invoices, :payer_name, :string
    add_column :invoices, :payer_email, :string
    add_column :invoices, :price, :float, :precision => 2
  end
end
