class InvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if !current_user
      redirect_to new_user_session_path
    else
      @invoices = current_user.invoices
    end
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
