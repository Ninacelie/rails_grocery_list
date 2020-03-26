class Item < ApplicationRecord
  # join table 
  belongs_to :user
  belongs_to :list
end
