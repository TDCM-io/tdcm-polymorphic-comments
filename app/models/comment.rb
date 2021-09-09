class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  validates :body, presence: true

  def find_parent
    return self.commentable unless self.commentable.is_a?(Comment)
    self.commentable.find_parent
  end
  
  def destroy
    update(deleted_at: Time.zone.now)
  end
end
