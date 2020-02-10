class Post < ApplicationRecord
     
    belongs_to :user
    has_many :comments, through: :friendships

    validates :content, {
        presence: true
    }

   

end
