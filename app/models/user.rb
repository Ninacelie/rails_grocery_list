class User < ApplicationRecord
  has_many :lists
  has_many :items 
  has_many :itemized_lists, through: :items 
end
