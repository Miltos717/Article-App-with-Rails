class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def new
    @category = Category.new
  end

  def edit
    @categories = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category name updtaed successfully"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created "
      redirect_to @category
    else

      render 'categories/new'
      flash[:alert] = "Try again"

    end
  end

  private

  def category_params
    params.require(:category).permit(:name) if params[:category].present?
  end

  def require_admin
    if !(logged_in? && current_users.admin?)
      flash[:alert] = "Only admin can perform that action"
      redirect_to categories_path
    end
  end

end