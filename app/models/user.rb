class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friend_requests, foreign_key: :receiver_id
  has_many :sent_requests, class_name: "FriendRequest", foreign_key: :sender_id
  has_and_belongs_to_many :friends, class_name: "User",
    join_table: :friends_users, foreign_key: :user_id, 
    association_foreign_key: :friend_id
  has_many :posts
  has_many :comments
end
