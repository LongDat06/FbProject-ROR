class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    has_many :likecomments, dependent: :destroy

    validates :user_id, presence: true
    validates :post_id, presence: true
    validates :content, presence: true
end
