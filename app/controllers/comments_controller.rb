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
        @userpost = Post.find(@comment.post_id)
        if current_user.id == @comment.user_id || current_user.id == @userpost.user_id
            @comment.destroy
        end
        redirect_to dashboard_path
    end

    private
    def comment_params
        params.require(:comment).permit(:content,:post_id)

    end
end
