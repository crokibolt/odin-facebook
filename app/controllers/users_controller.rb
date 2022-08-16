class UsersController < ApplicationController
    def index
        @user = User.find(params[:id])
        @friends = @user.friends
    end

    def show
        @user = User.find(params[:id])
        @posts = Post.where(user_id: @user.id)
        @post = Post.new
        @sent = FriendRequest.where(sender: current_user, receiver: @user)
    end
end
