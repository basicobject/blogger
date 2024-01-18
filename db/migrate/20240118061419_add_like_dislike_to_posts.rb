class AddLikeDislikeToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :like_count, :integer, default: 0
    add_column :posts, :dislike_count, :integer, default: 0
  end
end
