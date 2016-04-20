class UsersController < ApplicationController
    before_action :authenticate_user!    
    def show
      @user = User.find(current_user.id)
      @user_items = @user.items
    end
      
end