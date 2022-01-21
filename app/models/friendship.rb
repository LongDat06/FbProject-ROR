class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, class_name: 'User'

    validates :user_id, presence: true, uniqueness: { scope: :friend_id }
    validates :friend_id, presence: true

    def add_friend    
        Friendship.create(user_id: friend_id, friend_id: user_id)
    end

end
