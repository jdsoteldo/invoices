class InvoicesController < ApplicationController
  def index
  end

  def show
    @invoice ||= Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to invoice_path(@invoice)
    else
      render :new
    end
  end

  private

    def invoice_params
      params.require(:invoice).permit(:title, :services, :payer_name, :payer_email, :paid, :price)
    end
end
