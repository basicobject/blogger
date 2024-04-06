# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


if Rails.env.development?
  ActiveRecord::Base.transaction do
    user1 = User.create!(
      fullname: "Deepak Kumar",
      email: "user1@example.com",
      password: "password",
      password_confirmation: "password",
    )

    user1.confirm

    user2 = User.create!(
      fullname: "Amrutha",
      email: "user2@example.com",
      password: "password",
      password_confirmation: "password",
      )

    user2.confirm

    post1 = user1.posts.create!(
      title: "How to write a blog post",
      content: "If you’ve ever read a blog post, you’ve consumed content from a thought leader that is an expert in their industry. Chances are if the blog post was written effectively, you came away with helpful knowledge and a positive opinion about the writer or brand that produced the content.",
      is_published: true,
      like_count: 100,
      dislike_count: 20
    )

    post1.comments.create!(content: "love your post", user: user2, like_count: 4, dislike_count: 1)

    post2 = user2.posts.create!(
      title: "How to write your work notes",
      content: "If you’ve ever read a blog post, you’ve consumed content from a thought leader that is an expert in their industry. Chances are if the blog post was written effectively, you came away with helpful knowledge and a positive opinion about the writer or brand that produced the content.",
      is_published: true,
      like_count: 10,
      dislike_count: 2
    )
  end
end