class InvoicesController < ApplicationController
  before_action :current_biz
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
    build_invoice 
  end

  def create
    build_invoice
    save_invoice or render :new
  end

  private
    
    def current_biz
      @biz = Business.find_by(id: params[:business_id])
    end

    def invoice_params
      invoice_params = params[:invoice]
      invoice_params ? invoice_params.permit(:title, :services, :payer_name, :payer_email, :paid, :price, :business_id) : {}
    end

    def build_invoice
      @invoice ||= invoice_scope.build
      @invoice.attributes = invoice_params
    end
    
    def save_invoice
      if @invoice.save
        redirect_to business_invoice_path(@biz, @invoice)
      end
    end

    def invoice_scope
      @biz.invoices
    end

end
