class BusinessesController < ApplicationController

  def index
    if current_user.admin
      @businesses = Business.all
    else
      @businesses = current_user.businesses
    end
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(biz_params)
    @business.save
    redirect_to business_path(current_user, @business)
  end

  def show
    @user = current_user
    @business = Business.find_by(id: params[:id])
  end

  def destroy
  end

  private

  def biz_params
    params.require(:business).permit(:biz_name, :biz_website, :biz_type, :biz_email)
  end

end
