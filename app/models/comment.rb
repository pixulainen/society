class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :friend, through: :friendship


     # validate :friendly?

     private 

     # def friendly
     #     #if @user(self) is friends with user => post comment
     
    #  else
    #      self.errors.add(:user, "You must be friends with a user to post a comment to them!")
    #  end 
    #end
end
