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
    @business.user = current_user
    @business.save
    if @business.save
      redirect_to user_business_path(@business.user, @business)
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
    params.require(:business).permit(:name, :website, :biz_type, :email)
  end

end
