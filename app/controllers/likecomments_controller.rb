class LikecommentsController < ApplicationController
    def create
        @like = current_user.likecomments.build(comment_id: params[:id])
        @like.save
        redirect_to dashboard_path
      end
    
      def destroy
        @like = Likecomment.where(comment_id: params[:id], user_id: current_user.id )
        @like.destroy_all
        redirect_to dashboard_path
      end
    
end
