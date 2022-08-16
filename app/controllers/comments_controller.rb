class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = current_user.comments.build(comment_params)

        if @comment.save 
            flash[:notice] = "Success"
            redirect_back(fallback_location: root_path)
        else
            flash[:notice] = "Failure"
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        params[:id] = nil
        redirect_back(fallback_location: root_path)
    end

    private

    def comment_params
        params.require(:comment).permit(:post_id, :body, :user_id)
    end
end
