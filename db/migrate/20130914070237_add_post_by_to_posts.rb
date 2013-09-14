class AddPostByToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_by, :integer
  end
end
