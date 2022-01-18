class PostController < ApplicationController
    before_action :authenticate_user!
    def create
        @post = current_user.posts.build(post_params)
        if @post.save

            redirect_to dashboard_path
        else
            redirect_to dashboard_path
            
        end
    end
    
    def index
        
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to dashboard_path

    end
    
    private

    def post_params
        params.require(:post).permit(:content)
    end
end
