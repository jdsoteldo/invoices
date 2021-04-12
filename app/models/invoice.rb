class Invoice < ApplicationRecord

  belongs_to :business

  def send_confirmation
    if check_paid
      send_email
    else
      flash[:error] = "error"
    end
  end

  private

  def check_paid
    return True unless !@invoice.paid
  end

  def send_email
    # function for sending email
  end


end


# bootstrap
