class Dashboard::CategoriesController < Dashboard::ApplicationController
  before_action :set_category, only: %i[edit update destroy]

  def index
    @pagy, @categories = pagy(Category.all.order(created_at: :desc))
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(create_params)
    @category.slug = @category.name.parameterize
    if @category.save
      redirect_to dashboard_categories_path, notice: 'Category created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    update_attrs = update_params
    update_attrs[:slug] = update_attrs[:name].parameterize if update_attrs[:name].present?

    if @category.update(update_attrs)
      redirect_to edit_dashboard_category_path(@category.slug), notice: 'Category updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @category.destroy
      redirect_to dashboard_categories_path, notice: 'Category deleted successfully'
    else
      redirect_to dashboard_categories_path, alert: 'Failed to delete category'
    end
  end

  private

  def create_params
    params.require(:category).permit(:name, :description, :image)
  end

  def update_params
    params.require(:category).permit(:name, :description, :image)
  end

  def set_category
    @category = Category.find_by(slug: params[:slug])

    return if @category.present?

    redirect_to dashboard_categories_path, alert: 'Category not found'
  end
end
