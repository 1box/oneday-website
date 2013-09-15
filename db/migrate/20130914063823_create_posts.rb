class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts, options: 'CHARSET=utf8' do |t|
      t.integer :id
      t.text :content

      t.timestamps
    end
  end
end
