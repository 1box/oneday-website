class AddViewsCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :views_count, :integer
  end
end
