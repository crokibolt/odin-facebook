class FriendRequestsController < ApplicationController
    def create
        @request = FriendRequest.new(sender_id: params[:sender], receiver_id: params[:receiver])
        @request.save!
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @request = FriendRequest.find(params[:id])
        if params[:accepted]
            @request.sender.friends << @request.receiver
            @request.receiver.friends << @request.sender
        end

        @request.destroy!
        redirect_back(fallback_location: root_path)
    end
end
