class LikesController < ApplicationController
    def create
        @like = Like.new(like_params)

        if @like.save!
            flash[:notice] = "Post successfully liked"
        else
            flash[:alert] = "Unable to like this post"
        end
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @like = Like.find(params[:id])

        @like.destroy!
        redirect_back(fallback_location: root_path)
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end
end
