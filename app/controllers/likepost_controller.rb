class LikepostController < ApplicationController
    before_action :authenticate_user!

  def create
    @like = current_user.likeposts.build(post_id: params[:id])
    @like.save
    puts "SAdasdasjhjafasfsadfsadfASFSADfdas"
    redirect_to dashboard_path
  end

  def destroy
    @like = Likepost.where(post_id: params[:id], user_id: current_user.id )
    @like.destroy_all
    redirect_to dashboard_path
  end



end
