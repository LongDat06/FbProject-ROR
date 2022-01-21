class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @posts = current_user.feed

        @user = current_user
        
    end

    def show
        @posts = Post.where(user_id: params[:id])
        @user = User.find(params[:id])
    end


end
