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
        @received = FriendRequest.where(sender: @user, receiver: current_user)
    end

    def remove_friend
        @friend = User.find(params[:id])

        @friend.friends.delete(current_user)
        current_user.friends.delete(@friend)
        redirect_back(fallback_location: root_path)
    end
end
