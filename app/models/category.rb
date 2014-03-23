class Category < ActiveRecord::Base
  validates :name, length: { minimum: 10, maximum: 50 }, presence: true, uniqueness: true
  validates :short_name, length: { minimum: 10, maximum: 50 }, presence: true, uniqueness: true
  
  has_many :categorizations
  has_many :posts, through: :categorizations
end