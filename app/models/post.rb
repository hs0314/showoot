class Post < ApplicationRecord
  belongs_to :user, optional: true

  def self.generate_posts
    10.times do |index|
      post = Post.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraphs(3))
    end
  end
end
