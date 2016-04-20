class UsersController < ApplicationController
    before_action :authenticate_user!    
    def show
      @user = User.find(current_user.id)
      @user_items = @user.items
    end
    
    def add
      @item_entry = Item.find(params[:item])
      @user.items << @item_entry
      flash[:notice] = "Item added to nutrition log"
    end
      
end