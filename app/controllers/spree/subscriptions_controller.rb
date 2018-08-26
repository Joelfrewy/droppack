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
    @variant = Spree::Variant.find(params[:variant_id])
    spree_current_user.subscribe(@variant)
    respond_to do |format|
      format.html { redirect_to @variant.product }
      format.js
    end
  end

  def destroy
    @variant = Spree::Subscription.find(params[:id]).variant
    spree_current_user.unsubscribe(@variant)
    respond_to do |format|
      format.html { redirect_to @variant.product }
      format.js
    end
  end

  private

  def set_subscription
    @subscription = Spree::Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:variant_id)
  end
end