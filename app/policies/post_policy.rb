class PostPolicy

  attr_reader :user, :post
  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def edit?
    post.user == user
  end

  def like_or_dislike?
    user.present?
  end

  def delete?
    post.user == user
  end
end