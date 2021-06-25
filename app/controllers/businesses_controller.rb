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
    build_biz
    save_biz or render :new
  end

  def show
    @user = current_user
    @business = Business.find_by(id: params[:id])
  end

  def destroy
  end

  private

    def biz_params
      biz_params = params[:business]
      biz_params ? biz_params.permit(:name, :website, :biz_type, :email): {}
    end

    def build_biz
      @biz ||= biz_scope.build
      @biz.attributes = biz_params
    end
    
    def save_biz
      if @biz.save
        redirect_to @biz
      end
    end

    def biz_scope
      current_user.businesses
    end
end
