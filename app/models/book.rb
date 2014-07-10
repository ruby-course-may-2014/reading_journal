class Book < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :author, presence: true
  validates :rating, presence: true
  validates :published_at, presence: true
  validates :description, presence: true, length: { minimum: 10, allow_blank: true }
end
