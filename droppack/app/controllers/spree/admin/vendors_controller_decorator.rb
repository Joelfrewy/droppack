Spree::Admin::VendorsController.class_eval do
  def index
    # Relevant code in here
  end

  def new_coll_action
    # relevant code
  end

  def collection_actions
    [:index, :new_coll_action]
  end
  private
  def model_class
    Vendor
  end
end