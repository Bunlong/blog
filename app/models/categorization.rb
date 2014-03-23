class Categorization < ActiveRecord::Base
  validates :category_id, presence: true
  validates :post_id, presence: true

  belongs_to :category
  belongs_to :post
end
