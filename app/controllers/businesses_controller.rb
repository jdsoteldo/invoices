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
    @user = current_user
    @business.save
    if @business.save
      redirect_to user_business_path(@user, @business)
    else
      render :new
    end
  end

  def show
    @user = current_user
    @business = Business.find_by(id: params[:id])
  end

  def destroy
  end

  private

  def biz_params
    params.require(:business).permit(:user_id, :biz_name, :biz_website, :biz_type, :biz_email)
  end

end
