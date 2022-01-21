class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :posts
  has_many :comments
  has_many :friendships 
  has_many :friends, through: :friendships
  has_many :likeposts
  has_many :likecomments


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true


  def feed
    Post.where(user_id: friend_ids + [id])
  end

end
