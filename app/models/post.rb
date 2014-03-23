class Post < ActiveRecord::Base
  validates :title, length: { minimum: 10, maximum: 100 }, presence: true, uniqueness: true
  validates :body, length: { minimum: 20, maximum: 200 }
  validates :status, length: { minimum: 2, maximum: 20 }, presence: true
  validates :category_id, presence: true

  has_many :categorizations
  has_many :categories, through: :categorizations

  scope :search_by_title, lambda { |title|
    where("(title like ?) OR title in (?)", "%#{title}%", title.split)
  }
end