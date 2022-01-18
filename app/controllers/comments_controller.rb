class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save

            redirect_to dashboard_path
        else
            redirect_to dashboard_path
            
        end


    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to dashboard_path
    end

    private
    def comment_params
        params.require(:comment).permit(:content,:post_id)

    end
end
