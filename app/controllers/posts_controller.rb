class PostsController < ApplicationController
    def index
        @user = current_user
        @posts = Post.where(user_id: @user.id).or(Post.where(user_id: @user.friends.ids)).order(created_at: :desc)
        @comment = Comment.new
    end

    def new
        @post = Post.new
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def create
        @post = current_user.posts.build(post_params)

        if @post.save!
            flash[:notice] = "Post successfully created"
        else
            flash[:alert] = "Could not create post"
        end
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        params[:id] = nil
        redirect_back(fallback_location: root_path)

    end

    private

    def post_params
        if params.has_key?("post")
            params.require(:post).permit(:body, :user_id)
        else
            params.permit(:body, :user_id)
        end
    end
end
