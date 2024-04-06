class CommentPolicy

  attr_reader :user, :comment
  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def index?
    true
  end

  def new?
    user.present?
  end

  def like_or_dislike?
    user.present?
  end

  def delete?
    comment.user == user
  end
end