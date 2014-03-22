class Post < ActiveRecord::Base
  validates :title, length: { minimum: 100  }, presence: true, uniqueness: true
  validates :body, length: { minimum: 200  }
  validates :status, length: { minimum: 20  }, presence: true
end