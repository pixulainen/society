class Like < ApplicationRecord
    belongs_to :user, through: :posts
end
