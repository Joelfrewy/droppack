class Spree::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  def index
    @subscriptions = Subscription.all
  end

  def show
  end

  def new
  end

  def create
    @vendor = Spree::Vendor.find(params[:vendor_id])
    spree_current_user.subscribe(@vendor)
    respond_to do |format|
      format.html { redirect_to @vendor }
      format.js
    end
  end

  def destroy
    @vendor = Spree::Subscription.find(params[:id]).vendor
    spree_current_user.unsubscribe(@vendor)
    respond_to do |format|
      format.html { redirect_to @vendor }
      format.js
    end
  end

  private

  def set_subscription
    @subscription = Spree::Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:vendor_id)
  end
end