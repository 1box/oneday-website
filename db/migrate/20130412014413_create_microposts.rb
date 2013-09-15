class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts, options: 'CHARSET=utf8' do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
