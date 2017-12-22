class CreatePosts < ActiveRecord::Migration #소원쪽지, 설계도
  def change
    create_table :posts do |t|
      t.string :username
      t.string :title
      t.text :content
      t.timestamps null: false
    end
  end
end
