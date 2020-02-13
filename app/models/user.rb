class User < ApplicationRecord
    
    has_many :posts, dependent: :destroy
    has_many :comments, through: :posts
    has_secure_password
    validates :password_digest, presence: true
    validates :username, presence: true, uniqueness: :true
    validates :email, presence: true
    validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    def fullname
        "#{name}  #{surname}"
    end
  
end
