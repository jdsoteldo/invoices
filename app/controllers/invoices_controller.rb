class InvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if !current_user
      redirect_to new_user_session_path
    else
      @invoices = current_user.businesses.invoices
    end
  end

  def show
    @invoice ||= Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
    @business = Business.find_by(id: params[:business_id])
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.save
    if @invoice.save
      redirect_to business_invoice_path(@business, @invoice)
    else
      render :new
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:title, :services, :payer_name, :payer_email, :paid, :price, :business_id)
  end

end
