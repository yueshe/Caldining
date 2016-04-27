class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def item_params
    params.require(:name, :location, :mealtime).permit(:calories, :fat, :cholesterol, :protein, :sodium, :date, :calories_from_fat, :nutrition_available)
  end

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @halls = Hall.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit

  end

  # POST /items
  # POST /items.json
  def create
    if self.auth_admin
      return 
    end
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to item_path(@item), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if self.auth_admin
      return 
    end
    respond_to do |format|
      @item.update(item_params)
      format.html { redirect_to item_path(@item), notice: 'Item was successfully updated.' }
      format.json { render :show, status: :ok, location: @item }
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    self.auth_admin
    @item.destroy
    respond_to do |format|
      format.html { redirect_to hall_path(session[:hall_id]), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def add_servings
    @user = User.find(current_user.id)
    @item = params[:id]
    @serving = Serving.find_or_create_by(item: @item, user: @user)
    @serving.increment_by(:total, params[:serving_quantity])
    respond_to do |format|
      format.html { redirect_to item_path(@item), notice: "Item added to nutrition log" }
    end
  end
    
  def auth_admin
    return false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :calories, :fat, :carb, :cholesterol, :protein, :sodium, :location, :date)
    end
end
