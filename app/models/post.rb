# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  post_by    :integer
#

class Post < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :admin, class_name: "User", foreign_key: :post_by

  validates :title,   presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :post_by, presence: true

  def self.all_blogs
    all_blog_ids = %(SELECT id FROM posts)
    where("id IN (#{all_blog_ids})")
  end
end
