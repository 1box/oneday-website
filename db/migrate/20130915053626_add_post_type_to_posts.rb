class AddPostTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_type, :integer, default: 1
  end
end
