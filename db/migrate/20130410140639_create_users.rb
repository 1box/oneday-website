class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, options: 'CHARSET=utf8' do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
