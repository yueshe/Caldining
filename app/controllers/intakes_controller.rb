class IntakesController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def intake_params
    params.require(:calories).permit( :fat, :cholesterol, :protein, :sodium, :timeframe)
  end
  def index 
    @intakes = Intake.last
  end
  
  def create
    @intakes = Intake.new(intake_params)
    @intakes.save
  end
  
end