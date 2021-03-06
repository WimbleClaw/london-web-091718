class CupcakesController < ApplicationController
  before_action :set_ingredients, only: [:new, :edit]
  before_action :set_cupcake, only: [:show, :edit, :update, :destroy]
  before_action :set_customers, only: [:new, :edit]

  def index
    # byebug
    @cupcakes = Cupcake.all
  end

  def show
  end

  def new
    # byebug
    @cupcake = Cupcake.new
  end

  def create
    @cupcake = Cupcake.create(cupcake_params)
    if @cupcake.valid?
      redirect_to @cupcake
    else
      flash[:errors] = @cupcake.errors.full_messages
      redirect_to new_cupcake_path
    end
  end

  def update
    @cupcake.update(cupcake_params)
    if @cupcake.valid?
      redirect_to @cupcake
    else
      flash[:errors] = @cupcake.errors.full_messages
      redirect_to edit_cupcake_path(@cupcake)
    end
  end

  def edit
    # byebug
  end

  def destroy
    @cupcake.destroy
    redirect_to cupcakes_path
  end

  private

  def cupcake_params
    params.require(:cupcake).permit(:name, :price, :customer_id, ingredient_ids: [])
  end

  def set_cupcake
    @cupcake = Cupcake.find(params[:id])
  end

  def set_customers
    @customers = Customer.all
  end

  def set_ingredients
    @ingredients = Ingredient.all
  end
end
