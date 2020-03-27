class List < ApplicationRecord
  belongs_to :user
  has_many :items, through: :users 

  # validates :title, presence: true
  # validates :content, presence: true 
end
