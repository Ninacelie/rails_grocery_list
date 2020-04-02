class User < ApplicationRecord
  has_secure_password # access to built in validations and using bcrypt 

  has_many :lists
  # has_many :items, through: :lists 

  validates :username, presence: true, uniqueness: true 
  validates :email, presence: true


end
