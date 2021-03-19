class InvoicesController < ApplicationController

  def index
    @invoices = current_user.invoices
  end

  def show
    @invoice ||= Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user = current_user
    if @invoice.save
      redirect_to user_invoice_path(current_user, @invoice)
    else
      render :new
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:title, :services, :payer_name, :payer_email, :paid, :price)
  end

end
