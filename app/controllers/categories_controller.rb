class CategoriesController < ApplicationController

  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
  
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?)
      respond_to do |format|
        format.html { redirect_to categories_path, notice: 'You can only edit or delete your own articles.' }
        format.json { head :no_content }
        #redirect_to root_path
      end
    end
  end

end