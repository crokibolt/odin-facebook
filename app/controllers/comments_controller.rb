class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = current_user.comments.build(comment_params)

        if @comment.save 
            flash[:notice] = "Success"
        else
            flash[:notice] = "Failure"
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:post_id, :body)
    end
end
