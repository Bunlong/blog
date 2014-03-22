class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, limit: 100, default: '', null: false
      t.text :body
      t.string :status, limit: 20, default: '', null: false

      t.timestamps
    end
  end
end
