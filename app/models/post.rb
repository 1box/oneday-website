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

  # type: app: 1, tech: 2, default: 1
  attr_accessible :title, :content, :post_type
  belongs_to :admin, class_name: "User", foreign_key: :post_by

  validates :title,   presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :post_by, presence: true

  default_scope order: 'posts.created_at DESC'

  def abstract
    max_length = 300
    if content.length > max_length
      content[0..max_length] + "..."
    else
      content
    end
  end

  def self.all_blogs
    all_blog_ids = %(SELECT id FROM posts)
    where("id IN (#{all_blog_ids})")
  end

  def self.blogs_for_type(post_type)
    blog_ids = %(SELECT id FROM posts WHERE post_type = #{post_type})
    where("id IN (#{blog_ids})")
  end

  def self.recent_blogs(count)
    recent_blog_ids = %(SELECT t.id FROM (SELECT * FROM posts LIMIT #{count}) AS t)
    # recent_blog_ids = %(SELECT id FROM posts LIMIT #{count} )
    where("id IN (#{recent_blog_ids})")
  end
end
