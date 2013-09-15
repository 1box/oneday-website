class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts, options: 'CHARSET=utf8' do |t|
      t.integer :id
      t.string :content

      t.timestamps
    end
  end
end
