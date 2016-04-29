class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def item_params
    params.require(:name, :location, :mealtime).permit(:calories, :fat, :cholesterol, :protein, :sodium, :date, :calories_from_fat, :nutrition_available)
  end

  # GET /items
  # GET /items.json
  def index
    @items = Item.where(date: Date.today)
    @halls = Hall.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
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
    @hall = @item.location
    @item.destroy
    respond_to do |format|
      format.html { redirect_to hall_path(@hall), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def add_servings
    @user = User.find(current_user.id)
    @item = Item.find(params[:id])
    @serving = Serving.find_or_create_by(item: @item, user: @user)
    @serving.increment(:total, params[:serving_quantity].to_i)
    @serving.save
    respond_to do |format|
      format.html { redirect_to :back, notice: "#{params[:serving_quantity].to_i} Serving(s) added to log" }
    end
  end
  
  def edit_servings
    @user = User.find(current_user.id)
    @item = Item.find(params[:id])
    @serving = Serving.find_or_create_by(item: @item, user: @user)
    @serving.update_attribute :total, params[:serving_quantity].to_i
    respond_to do |format|
      if @serving.total <= 0
        @serving.delete
        format.html { redirect_to :back, notice: "Removed #{@item} from log" }
      else
        @serving.save
        format.html { redirect_to :back, notice: "Changed to #{params[:serving_quantity].to_i} Serving(s)" }
      end
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
      params.require(:item).permit(:name, :calories, :fat, :carb, :cholesterol, :protein, :sodium, :location, :mealtime)
    end
end
