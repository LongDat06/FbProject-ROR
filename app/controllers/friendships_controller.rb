class FriendshipsController < ApplicationController
    before_action :authenticate_user!
  
    def create
        @friendship = current_user.friendships.build(friendship_params)
        @friendship.save   
        @friendship.add_friend

        redirect_to dashboard_path

    end
  
    def destroy
        @friendship = Friendship.where(user_id: current_user.id, friend_id: params[:id] )
        @friendship1 = Friendship.where(user_id: params[:id], friend_id: current_user.id )

        @friendship.each(&:destroy)
        @friendship1.each(&:destroy)

        redirect_to dashboard_path

    end

    private
  
    def friendship_params
      params.require(:friendship).permit(:friend_id)
    end
  
end
