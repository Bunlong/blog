class AddCategoryToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :category
  end
end
