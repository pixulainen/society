class User < ApplicationRecord
    # has_many :friend_requests, dependent: :destroy
    # has_many :pending_friends, through: :friend_requests, source: :friend
    # has_many :friendships, dependent: :destroy
    # has_many :friends, through: :friendships
    has_many :posts, dependent: :destroy
    has_many :comments, through: :posts



    # def remove_friend(friend)
    #     current_user.friends.destroy(friend)
    # end

end
