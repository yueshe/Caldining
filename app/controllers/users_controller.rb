class UsersController < ApplicationController
    before_action :authenticate_user!    
    def show
      @user = User.find(current_user.id)
      @items = Item.where(id: 1)#Item.where(User.where(current_user.id).pluck(:item_id))
    end
end