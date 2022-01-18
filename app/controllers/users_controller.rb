class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @posts = Post.all
        @user = current_user
        
    end

    def personalpage
        @posts = Post.where(user_id: current_user.id)
    end


end
