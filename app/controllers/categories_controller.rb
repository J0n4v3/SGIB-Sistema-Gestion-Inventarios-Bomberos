class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_encargado_or_admin
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @categories = Category.all.order(:nombre)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Categoría creada correctamente."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "Categoría actualizada correctamente."
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path, notice: "Categoría eliminada."
    else
      redirect_to categories_path, alert: "No se puede eliminar la categoría, tiene productos asociados."
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:nombre, :descripcion)
  end
end
