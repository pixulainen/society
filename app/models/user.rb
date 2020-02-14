class User < ApplicationRecord
    
    has_many :posts, dependent: :destroy
    has_many :comments, through: :posts
    has_secure_password
    validates :password_digest, presence: true
    validates :username, presence: true, uniqueness: :true
    validates :username, {presence: true, 
                          format: { with: /\A[a-zA-Z0-9]+\Z/ }}
    validates :email, presence: true
    validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    def fullname
        "#{name}  #{surname}"
    end
    def new
        @user = User.new
    end
    def  self.search(search)
        if search  
          user = User.find_by(name: search)
          if user
            self.where(user_id: user)
          else
            User.all
          end
        else
          User.all
    end
end
end
