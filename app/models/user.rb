class User < ApplicationRecord
    has_many :friend_requests, dependent: :destroy
    has_many :pending_friends, through: :friend_requests, source: :friend
    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships
    has_many :posts, dependent: :destroy
    has_many :comments, through: :posts
    has_secure_password
    validates :username, presence: true,uniqueness: :true
    validates :email, presence: true
    validates :password_digest, presence: true
    validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    def fullname
        "#{name}  #{surname}"
    end
    def remove_friend(friend)
        current_user.friends.destroy(friend)
    end

end
