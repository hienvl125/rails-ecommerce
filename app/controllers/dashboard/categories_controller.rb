class Dashboard::CategoriesController < Dashboard::ApplicationController
  def index
    @pagy, @categories = pagy(Category.all.order(created_at: :desc))
  end
end
