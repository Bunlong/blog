class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, limit: 50, default: '', null: false
      t.string :short_name, limit: 50, default: '', null: false
      t.text :description

      t.timestamps
    end
  end
end
