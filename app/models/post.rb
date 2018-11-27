class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  has_many :user_posts
  has_one :codi

  def self.generate_posts
    10.times do |index|
      post = Post.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraphs(3))
    end
  end
end
