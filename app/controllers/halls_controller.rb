class HallsController < ApplicationController
  before_action :set_hall, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]
  # GET /halls
  # GET /halls.json
  def index
    @halls = Hall.all
  end

  # GET /halls/1
  # GET /halls/1.json
  def show
    @items = Item.where(location: @hall.name)
  end

  # GET /halls/new
  def new
    if self.auth_admin
      return 
    end
    @hall = Hall.new
  end

  # GET /halls/1/edit
  def edit
    if self.auth_admin
      return 
    end
  end

  # POST /halls
  # POST /halls.json
  def create
    if self.auth_admin
      return 
    end
    @hall = Hall.new(hall_params)
    
    respond_to do |format|
      @hall.save
      format.html { redirect_to @hall, notice: 'Hall was successfully created.' }
      format.json { render :show, status: :created, location: @hall }
    end
  end

  # PATCH/PUT /halls/1
  # PATCH/PUT /halls/1.json
  def update
    if self.auth_admin
      return 
    end
    respond_to do |format|
      @hall.update(hall_params)
      format.html { redirect_to @hall, notice: 'Hall was successfully updated.' }
      format.json { render :show, status: :ok, location: @hall }
    end
  end

  # DELETE /halls/1
  # DELETE /halls/1.json
  def destroy
    if self.auth_admin
      return 
    end
    @hall.destroy
    respond_to do |format|
      format.html { redirect_to halls_url, notice: 'Hall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def auth_admin
      return false
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hall
      @hall = Hall.find(params[:id])
      session[:hall_id] = @hall.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hall_params
      params.require(:hall).permit(:name)
    end
    
end
