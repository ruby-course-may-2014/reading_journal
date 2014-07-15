class User < ActiveRecord::Base
  include Clearance::User
  has_many :books
  validates :email, presence: true, 
                    length: {minimum: 3, allow_blank: true},
                    uniqueness: true,
                    format: {with: /\A([\w]+)@([\w]+).([a-z]{2,})\z/i}
  validates :password, presence: true, length: { minimum: 3, allow_blank: true }
end
