class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def username
    self.user.username
  end

  def post_title
    self.post.title
  end

  def user_attributes=(user_attributes)
    self.user = User.find_or_create_by(user_attributes) unless user_attributes[:username].blank?
  end
end
