class Post < ApplicationRecord
  validates :title, presence: true
  has_many :comments, as: :commentable
  
  def to_s
    title
  end
end
