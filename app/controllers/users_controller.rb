class UsersController < ApplicationController
    before_action :authenticate_user!    
    def show
      @user = User.find(current_user.id)
      @todays_servings = @user.items.where(:date => Date.today)
    end
end